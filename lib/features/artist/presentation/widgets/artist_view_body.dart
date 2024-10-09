import 'package:flutter/material.dart';
import 'package:spotify/features/artist/presentation/widgets/albums_list_view.dart';
import 'package:spotify/features/artist/presentation/widgets/artist_details_section.dart';
import 'package:spotify/features/home/presentation/widgets/songs_play_list.dart';

class ArtistViewBody extends StatelessWidget {
  const ArtistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ArtistDetailsSection(),
          SizedBox(height: 24),
          Text(
            'Albums',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 160,
            child: AlbumsListview(),
          ),
          SizedBox(
            height: 35,
          ),
          Text(
            'Songs',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SongsPlayListListView(songs: []),
        ],
      ),
    );
  }
}
