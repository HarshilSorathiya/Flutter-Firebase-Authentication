import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_firebase_auth/Widgets/custom_button.dart';

import '../Widgets/custom_textfield.dart';

class PhoneScreen extends StatelessWidget {
  TextEditingController phoneNumberController = TextEditingController();

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
              controller: phoneNumberController,
              text: 'Email',
            ),
          ),
          SizedBox(height: 50),
          CustomButton(onPressed: () {}, text: "Sign Up")
        ],
      ),
    );
  }
}
