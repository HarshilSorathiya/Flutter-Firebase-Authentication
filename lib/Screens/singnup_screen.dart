import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_firebase_auth/Services/firebase_auth_methodes.dart';
import 'package:flutter_firebase_auth/Widgets/custom_button.dart';

import '../Widgets/custom_textfield.dart';

class SingUpScreen extends StatefulWidget {
  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  void signUpUser() async {
    FirebaseAuthMethods(FirebaseAuth.instance).signupWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context);
    // emailController.clear();
    // passwordController.clear();
  }

  // String? validateEmail(String? formEmail) {
  //   if (formEmail == null || formEmail.isEmpty)
  //     return 'E-mail address is required.';
  // }

  // String? validatePassword(String? formPassword) {
  //   if (formPassword == null || formPassword.isEmpty)
  //     return 'Password is required.';

  //   return null;
  // }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp with Email'),
        backgroundColor: Colors.indigo,
      ),
      body: Form(
        key: _key,
        child: Column(
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
            CustomButton(onPressed: signUpUser, text: "Sign Up")
          ],
        ),
      ),
    );
  }
}
