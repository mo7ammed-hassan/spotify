import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class AuthSupportText extends StatelessWidget {
  const AuthSupportText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'If you need any support ',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.grey,
            ),
          ),
          TextSpan(
            text: 'click here',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.primary,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
