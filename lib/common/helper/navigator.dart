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

  void pop() {
    Navigator.pop(this);
  }
}
