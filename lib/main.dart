import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:project_lamplight/interface/macros.dart';
import 'package:project_lamplight/pages/login_page.dart';
import 'package:project_lamplight/pages/sign_up_page.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:project_lamplight/pages/user_options.dart';
import 'package:vibration/vibration.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform
    );

    FirebaseDatabase.instance.setPersistenceEnabled(true);

    final cron = Cron();

    cron.schedule(Schedule.parse("*/255 * * * *"), () async {
        print("runs");
        var res = await Vibration.hasVibrator();
        if (res != null && res) {
            Vibration.vibrate();
            print('vibin');
        }
    });

    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
	return MaterialApp(
	  title: 'Lamplight',
	  theme: ThemeData(
		colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 255, 208), brightness: Brightness.dark),
		useMaterial3: true,
		brightness: Brightness.dark
	  ),
	  home: const GlobalPage(),
	);
  }
}

class GlobalPage extends StatefulWidget  {
  const GlobalPage({super.key});

  @override
  State<GlobalPage> createState() => GlobalPageState();
}

class GlobalPageState extends State<GlobalPage> with TickerProviderStateMixin {

    bool isEditingMacro = false;

    bool isSignIn = false;
    bool registerState = true;
    bool isEditingSettings = false;

    User? user;

    @override
    void initState() {
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
            if (user != null) {
                setState(() {
                    this.user = user;
                });
            }
            else {
                setState(() {
                    this.user = null;
                });
            }
        });
        super.initState();
    }

    @override
    Widget build(BuildContext context) {

        if (FirebaseAuth.instance.currentUser == null) {
            setState(() {
                isSignIn = true;
            });
        }

        return DefaultTabController(initialIndex: 0, length: 3, 
            child: Scaffold(
                bottomNavigationBar: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 70,
                    child: BottomAppBar(
                        child: Row(
                            children: [
                                IconButton(
                                    onPressed: () {
                                        setState(() {
                                            isEditingSettings = true;
                                        });
                                    }, icon: const Icon(Icons.more_horiz, color: Color.fromARGB(255, 255, 255, 255))
                                ),
                                IconButton(
                                    onPressed: () {
                                        setState(() {
                                            isSignIn = true;
                                        });
                                    }, icon: const Icon(Icons.person, color: Color.fromARGB(255, 255, 255, 255))
                                ),
                            ]
                        ),
                    ),
                ),
                body: isSignIn ? 
                (
                    registerState ?
                    SignUpPage(callback: () {
                        setState(() {
                            isSignIn = false;
                        });
                    }, switchMode: () {
                        setState(() {
                            registerState = !registerState;
                        });
                    }) : LogInPage(callback: () {
                        setState(() {
                            isSignIn = false;
                        });
                    }, switchMode: () {
                        setState(() {
                            registerState = !registerState;
                        });
                    })
                )
                
                :  isEditingSettings 
                    ? UserOptionsPage(callback: () => setState(() => isEditingSettings = false)) 
                : MacrosPage(globalState: this),
                floatingActionButton: !isEditingMacro && !isSignIn ?
                    FloatingActionButton(onPressed: () {
                        setState(() {
                            isEditingMacro = true;
                        });
                    }, child: const Icon(Icons.add, color: Colors.white)
                ) : null,
                floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            )
        );
    }
}
