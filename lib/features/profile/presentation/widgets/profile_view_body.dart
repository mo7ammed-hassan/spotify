import 'package:flutter/material.dart';
import 'package:spotify/features/profile/presentation/widgets/profile_info_card.dart';

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
