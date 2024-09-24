import 'package:flutter/material.dart';

extension NavigatorHelper on BuildContext {
  void push(Widget view) {
    Navigator.push(
      this,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  void pop() {
    Navigator.pop(this);
  }
}
