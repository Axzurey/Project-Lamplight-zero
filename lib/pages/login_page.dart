import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<bool> loginEmail(BuildContext context, String email, String password) async {
    try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        if (context.mounted) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Login Successful!"),
                )
            );
        }
        return true;
    }
    on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        if (e.code == "wrong-password") {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: const Text("Incorrect password."),
                    action: SnackBarAction(label: "Got it!", onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    }),
                )
            );
        }
        else if (e.code == 'user-not-found') {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: const Text("No account exists with this email."),
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
        else if (e.code == 'user-disabled') {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: const Text("The associated account is disabled."),
                    action: SnackBarAction(label: "Got it!", onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    }),
                )
            );
        }
        else {
             ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                content: const Text("An unknown error has occured during login."),
                action: SnackBarAction(label: "Retry", onPressed: () {
                    loginEmail(context, email, password);
                }),
            )
            );
        }
    }
    catch (e) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: const Text("An unknown error has occured during login."),
                action: SnackBarAction(label: "Retry", onPressed: () {
                    loginEmail(context, email, password);
                }),
            )
        );
    }
    return false;
}

class LogInPage extends StatefulWidget {
    const LogInPage({super.key, required this.callback, required this.switchMode});

    final void Function() callback;
    final void Function() switchMode;
    
    @override
    State<LogInPage> createState() => LogInPageState();
}

class LogInPageState extends State<LogInPage> {

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
                        child: Text("Please Sign In to continue."),
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
                        child: Padding(padding: const EdgeInsets.only(top: 15),
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
                                    child: const Text("I don't have an account"),
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
                                    child: const Text("Sign in"),
                                    onPressed: () async {
                                        bool res = await loginEmail(context, email, password);
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