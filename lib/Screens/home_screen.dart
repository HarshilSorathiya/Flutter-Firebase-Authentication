import 'package:flutter/material.dart';

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
              onPressed: () {},
              text: ' Google Login',
            ),
            CustomButton(
              onPressed: () {},
              text: 'FaceBook Login',
            ),
            CustomButton(
              onPressed: () {},
              text: 'LogIn with Anonymose',
            ),
          ],
        ),
      ),
    );
  }
}
