import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class ChooseModeCard extends StatelessWidget {
  const ChooseModeCard({
    super.key,
    required this.modeTitle,
    required this.vectorPath,
    this.onTap,
  });
  final String modeTitle;
  final String vectorPath;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xff30393c).withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  vectorPath,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          modeTitle,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
