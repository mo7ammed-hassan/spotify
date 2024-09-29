import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/features/home/presentation/widgets/home_tab_bar.dart';
import 'package:spotify/features/home/presentation/widgets/play_list_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          width: 38,
          height: 38,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 28,
            ),
            _homeTopCard(),
            const HomeTabBar(),
            const PlayListSection(),
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 130,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                AppVectors.homeTopCard,
                //width: 380,
              ),
            ),
            Positioned(
              bottom: 0,
              top: -50,
              right: 55,
              child: Image.asset(
                AppImages.homeArtist,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
