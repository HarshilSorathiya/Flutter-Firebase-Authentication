import 'package:flutter/material.dart';

showSnackBar(
  BuildContext context,
  String content,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Color.fromARGB(255, 72, 86, 162),
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      content: Text(
        content,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
