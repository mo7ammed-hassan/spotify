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
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => view,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween<double>(begin: 0.7, end: 1.0);
          var scaleAnimation = animation.drive(tween);

          return ScaleTransition(
            scale: scaleAnimation,
            child: child,
          );
        },
      ),
      // MaterialPageRoute(
      //   builder: (context) => view,
      // ),
      (route) => false,
    );
  }

  void pop() {
    Navigator.pop(this);
  }

  void pushReplacement(Widget view) {
    Navigator.pushReplacement(
      this,
      PageRouteBuilder(
        transitionDuration: Duration(seconds: 1),
        pageBuilder: (context, animation, secondaryAnimation) => view,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween<double>(begin: 0.1, end: 1.0);
          var scaleAnimation = animation.drive(tween);

          return ScaleTransition(
            scale: scaleAnimation,
            child: child,
          );
        },
      ),
    );
  }

  void pushScaleTransition(Widget view) {
    Navigator.push(
      this,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => view,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween<double>(begin: 0.2, end: 1.0);
          var scaleAnimation = animation.drive(tween);

          return ScaleTransition(
            scale: scaleAnimation,
            child: child,
          );
        },
      ),
    );
  }

  void pushSlideTransition(Widget view) {
    Navigator.push(
      this,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 700),
        pageBuilder: (context, animation, secondaryAnimation) => view,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0);
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var slideAnimation = animation.drive(tween);

          return SlideTransition(
            position: slideAnimation,
            child: child,
          );
        },
      ),
    );
  }
}
