import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProfileInfoCard(),
      ],
    );
  }
}

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,
      decoration: profileCardDecoration(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(AppVectors.profileTopPattern),
          ),
          const SafeArea(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.red,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  BoxDecoration profileCardDecoration(BuildContext context) {
    return BoxDecoration(
      color: context.isDarkMode
          ? const Color(0xff2C2B2B)
          : const Color(0xffFFFFFF),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(80),
        bottomRight: Radius.circular(80),
      ),
    );
  }
}
