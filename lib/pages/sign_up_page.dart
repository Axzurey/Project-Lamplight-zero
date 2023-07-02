import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<bool> registerEmail(BuildContext context, String email, String password) async {
    try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        if (context.mounted) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Registration Successful, you have been signed in."),
                )
            );
        }
        return true;
    }
    on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        if (e.code == "weak-password") {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: const Text("The password you have is too short. It must be longer than 5 characters."),
                    action: SnackBarAction(label: "Got it!", onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    }),
                )
            );
        }
        else if (e.code == 'email-already-in-use') {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: const Text("An account is already registered with this email."),
                    action: SnackBarAction(label: "Got it!", onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    }),
                )
            );
        }
        else if (e.code == 'invalid-email') {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: const Text("The email used is invalid."),
                    action: SnackBarAction(label: "Got it!", onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    }),
                )
            );
        }
        else {
             ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                content: const Text("An unknown error has occured during registration."),
                action: SnackBarAction(label: "Retry", onPressed: () {
                    registerEmail(context, email, password);
                }),
            )
            );
        }
    }
    catch (e) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: const Text("An unknown error has occured during registration."),
                action: SnackBarAction(label: "Retry", onPressed: () {
                    registerEmail(context, email, password);
                }),
            )
        );
    }
    return false;
}

class SignUpPage extends StatefulWidget {
    const SignUpPage({super.key, required this.callback, required this.switchMode});

    final void Function() callback;
    final void Function() switchMode;
    
    @override
    State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {

    String email = "";
    String password = "";
    String username = "";

    @override
    Widget build(BuildContext context) {
        return Column(
            children: [
                const Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text("Please Register to continue."),
                    )
                ),
                Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * .8,
                        child: Padding(padding: const EdgeInsets.only(top: 50),
                            child: TextField(
                                onChanged: (value) => setState(() {
                                    email = value;
                                }),
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.email),
                                    prefixIconColor: Colors.amber,
                                    border: OutlineInputBorder(),
                                    labelText: "Email"
                                ),
                            )
                        ),
                    ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * .8,
                        child: Padding(padding: const EdgeInsets.only(top: 20),
                            child: TextField(
                                onChanged: (value) => setState(() {
                                    username = value;
                                }),
                                maxLength: 15,
                                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    prefixIconColor: Colors.amber,
                                    border: OutlineInputBorder(),
                                    labelText: "Username"
                                ),
                            )
                        ),
                    ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * .8,
                        child: Padding(padding: const EdgeInsets.only(top: 5),
                            child: TextField(
                                onChanged: (value) => setState(() {
                                    password = value;
                                }),
                                obscureText: true,
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.password),
                                    prefixIconColor: Colors.amber,
                                    border: OutlineInputBorder(),
                                    labelText: "Password"
                                ),
                            )
                        ),
                    ),
                ),
                Row(
                    children: [
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(padding: EdgeInsets.only(top: 20, left: MediaQuery.of(context).size.width * .5 - MediaQuery.of(context).size.width * .4),
                                child: TextButton(
                                    child: const Text("I already have an account"),
                                    onPressed: () {
                                        widget.switchMode();
                                    },
                                ),
                            )
                        ),
                        Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(padding: EdgeInsets.only(top: 20, left: MediaQuery.of(context).size.width * .5 - MediaQuery.of(context).size.width * .4),
                                child: TextButton(
                                    child: const Text("Register"),
                                    onPressed: () async {
                                        bool res = await registerEmail(context, email, password);
                                        if (res) {
                                            widget.callback();
                                        }
                                    },
                                ),
                            )
                        )
                    ]
                )
            ],
        );
    }
}