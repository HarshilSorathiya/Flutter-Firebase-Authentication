import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_firebase_auth/Widgets/custom_button.dart';

import '../Widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp with Email'),
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
          CustomButton(
              onPressed: () {
                print(emailController.text);
                print(passwordController.text);
              },
              text: "Login")
        ],
      ),
    );
  }
}
