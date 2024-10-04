import 'package:flutter/material.dart';
import 'package:spotify/features/profile/presentation/widgets/favorite_songs.dart';
import 'package:spotify/features/profile/presentation/widgets/profile_info_card.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileInfoCard(),
        SizedBox(height: 25),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            'Favorite Playlists',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 16),
        FavoriteSongs(),
      ],
    );
  }
}


