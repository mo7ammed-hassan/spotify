import 'package:flutter/material.dart';
import 'package:spotify/core/configs/assets/app_images.dart';

class ArtistDetailsSection extends StatelessWidget {
  const ArtistDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.33,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(60),
              bottomLeft: Radius.circular(60),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.profileImage),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'Artist Name',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8),
        const Text(
          '2 Album , 67 Track',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis adipiscing vestibulum orci enim, nascetur vitae ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
