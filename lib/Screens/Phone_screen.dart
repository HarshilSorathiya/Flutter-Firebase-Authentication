import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_firebase_auth/Services/firebase_auth_methodes.dart';
import 'package:flutter_firebase_auth/Widgets/custom_button.dart';

import '../Widgets/custom_textfield.dart';

class PhoneScreen extends StatefulWidget {
  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  TextEditingController phoneNumberController = TextEditingController();

  void phoneSignIn() {
    FirebaseAuthMethods(FirebaseAuth.instance).verifyPhoneNumber(
        phoneNumber: phoneNumberController.text, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignIn with Phone Number'),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 330,
            child: CustomTextField(
              controller: phoneNumberController,
              text: 'Phone Number',
            ),
          ),
          SizedBox(height: 50),
          CustomButton(onPressed: phoneSignIn, text: "Send OTP")
        ],
      ),
    );
  }
}
