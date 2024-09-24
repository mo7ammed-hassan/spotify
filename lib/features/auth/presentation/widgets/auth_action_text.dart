import 'package:flutter/material.dart';

class AuthActionText extends StatelessWidget {
  final String title;
  final String actionText;
  final Function() onPressed;
  const AuthActionText({
    super.key,
    required this.title,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              actionText,
              style: const TextStyle(
                color: Color(0xff288CE9),
              ),
            ),
          )
        ],
      ),
    );
  }
}
