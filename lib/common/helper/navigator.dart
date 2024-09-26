import 'package:flutter/material.dart';

extension NavigatorHelper on BuildContext {
  void push(Widget view) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => view,
      ),
    );
  }

  void pushAndRemoveUtil(Widget view) {
    Navigator.pushAndRemoveUntil(
      this,
      MaterialPageRoute(
        builder: (context) => view,
      ),
      (route) => false,
    );
  }

  void pop() {
    Navigator.pop(this);
  }
}
