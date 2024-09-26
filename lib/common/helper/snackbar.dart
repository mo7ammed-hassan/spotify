import 'package:flutter/material.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      backgroundColor: Colors.black87,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      action: SnackBarAction(
        label: 'Undo',
        textColor: Colors.orange,
        onPressed: () {
          // Your undo action
        },
      ),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(10),
    );

    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
