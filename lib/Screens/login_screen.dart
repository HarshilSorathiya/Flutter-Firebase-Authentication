import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_firebase_auth/Services/firebase_auth_methodes.dart';
import 'package:flutter_firebase_auth/Widgets/custom_button.dart';

import '../Widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void singinUser() async {
    await FirebaseAuthMethods(FirebaseAuth.instance).signinWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LogIn with Email'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 330,
            child: CustomTextField(
              controller: emailController,
              text: 'Email',
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
              width: 330,
              child: CustomTextField(
                controller: passwordController,
                text: 'Password',
              )),
          SizedBox(height: 40),
          CustomButton(onPressed: singinUser, text: "Login")
        ],
      ),
    );
  }
}
