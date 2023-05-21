import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/Services/firebase_auth_methodes.dart';

import '../Widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, '/1');
              },
              text: 'SignUp with Email',
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, '/2');
              },
              text: 'LogIn with Email',
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, '/3');
              },
              text: 'LogIn with PhoneNumber',
            ),
            CustomButton(
              onPressed: () {
                FirebaseAuthMethods(FirebaseAuth.instance)
                    .signInWithGoogle(context);
              },
              text: ' Google Login',
            ),
            CustomButton(
              onPressed: () {},
              text: 'FaceBook Login',
            ),
            CustomButton(
              onPressed: () {
                FirebaseAuthMethods(FirebaseAuth.instance)
                    .signInAnonymous(context);
              },
              text: 'LogIn with Anonymose',
            ),
          ],
        ),
      ),
    );
  }
}
