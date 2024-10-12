import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/common/helper/navigator.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/features/home/presentation/widgets/home_view_body.dart';
import 'package:spotify/features/profile/presentation/views/profile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        leadingWidget: IconButton(
          style: ButtonStyle(
            iconColor: WidgetStatePropertyAll(
              context.isDarkMode
                  ? const Color(0xffCFCFCF)
                  : const Color(0xff2D264B),
            ),
          ),
          onPressed: () {},
          icon: SvgPicture.asset(
            AppVectors.search,
            colorFilter: context.isDarkMode
                ? const ColorFilter.mode(Color(0xffCFCFCF), BlendMode.srcIn)
                : const ColorFilter.mode(Color(0xff2D264B), BlendMode.srcIn),
          ),
        ),
        title: SvgPicture.asset(
          AppVectors.logo,
          width: 38,
          height: 38,
        ),
        action: IconButton(
          onPressed: () {
            context.push(
              const ProfileView(),
            );
          },
          icon: Icon(
            Icons.person,
            color: context.isDarkMode
                ? const Color(0xffDDDDDD)
                : const Color(0xff7D7D7D),
          ),
        ),
      ),
      body: HomeViewBody(),
    );
  }
}
