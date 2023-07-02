import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserOptionsPage extends StatefulWidget {
    const UserOptionsPage({super.key, required this.callback});

    final void Function() callback;
    
    @override
    State<UserOptionsPage> createState() => UserOptionsPageState();
}

class UserOptionsPageState extends State<UserOptionsPage> {

    Uint8List? data;

    @override
    Widget build(BuildContext context) {

        final profilePicture = FirebaseStorage.instance.ref().child("profiles/${FirebaseAuth.instance.currentUser!.uid}");
        
        profilePicture.getData(1024 * 1024 * 2).then((v) => setState(() => data = v));

        return Stack(
            children: [
                Column(
                    children: [
                        Align(
                            alignment: Alignment.topCenter, 
                            child: IconButton(icon: data == null ? const Icon(Icons.person) : Image.memory(data!), color: Colors.amber, onPressed: () async {
                                FilePickerResult? result = await FilePicker.platform.pickFiles(allowedExtensions: ['jpg', 'png', 'jpeg', 'png', 'gif', 'webp', 'bmp']);

                                if (result != null) {
                                    File file = File(result.files.single.path!);
                                    try {
                                        await profilePicture.putFile(file);
                                    } on FirebaseException catch (_) {
                                        if (context.mounted) {
                                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(
                                                    content: Text("There was an error while uploading the image."),
                                                )
                                            );
                                        }
                                    }
                                    catch(_) {
                                        if (context.mounted) {
                                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(
                                                    content: Text("There was an unexpected error while uploading the image."),
                                                )
                                            );
                                        }
                                    }
                                }
                            })
                        ),
                    ]
                ),
                Align(alignment: Alignment.bottomRight, child:
                    Padding(padding: const EdgeInsets.only(right: 20, bottom: 20), child: FloatingActionButton.extended(
                        onPressed: widget.callback,
                        label: const Text("Done"),
                        icon: const Icon(Icons.check)
                    ))
                ),
            ]
        );
    }
}