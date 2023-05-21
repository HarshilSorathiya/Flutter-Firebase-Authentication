import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_firebase_auth/Services/firebase_auth_methodes.dart';
import 'package:flutter_firebase_auth/Widgets/custom_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  GoogleSignIn googleUser = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
            onPressed: () async {
              FirebaseAuthMethods(FirebaseAuth.instance).signOut(context);
            },
            text: "Sign Out"),
      ),
    );
  }
}
