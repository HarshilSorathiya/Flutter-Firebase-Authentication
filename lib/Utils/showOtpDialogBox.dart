import 'package:flutter/material.dart';

void showOTPDialogBox({
  required BuildContext context,
  required TextEditingController codeController,
  required VoidCallback onPressed,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return SizedBox(
        height: 300,
        child: AlertDialog(
          title: Text('Enter OTP'),
          content: Column(
            children: [
              TextField(
                controller: codeController,
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: onPressed,
              child: Text('Done'),
            ),
          ],
        ),
      );
    },
  );
}
