import 'package:flutter/material.dart';

showSnackBar(String content, BuildContext context, bool isCorrect) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isCorrect ? Colors.green : Colors.red,
      content: Text(content),
      duration: Duration(seconds: 2),
    ),
  );
}
