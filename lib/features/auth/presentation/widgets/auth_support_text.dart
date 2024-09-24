import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class AuthSupportText extends StatelessWidget {
  const AuthSupportText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'If You Need Any Support ',
            style: TextStyle(
              fontSize: 14,
              color: context.isDarkMode ? AppColors.grey : Colors.black,
            ),
          ),
          TextSpan(
            text: 'click Here',
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.primary,
              // decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
