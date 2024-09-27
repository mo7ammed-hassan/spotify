import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';

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
            _homeTopCard(),
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                AppVectors.homeTopCard,
              ),
            ),
            Positioned(
              top: -40,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only(right: 45),
                child: Image.asset(
                  AppImages.homeArtist,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
