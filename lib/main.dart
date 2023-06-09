import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/Screens/singnup_screen.dart';
import 'package:flutter_firebase_auth/firebase_options.dart';

import 'Screens/Phone_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/login_screen.dart';
import 'Widgets/custom_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      routes: {
        "/1": (context) => SingUpScreen(),
        "/2": (context) => LoginScreen(),
        "/3": (context) => PhoneScreen()
      },
      home: Scaffold(body: HomePage()),
    );
  }
}
