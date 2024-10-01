import 'package:flutter/material.dart';

import 'package:spotify/features/home/domain/entities/song.dart';
import 'package:spotify/features/profile/presentation/widgets/favorite_song_card.dart';

class FavoriteSongsListView extends StatelessWidget {
  final List<SongEntity> songs;
  const FavoriteSongsListView({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      shrinkWrap: true,
      itemCount: songs.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return FavoriteSongCard(
          song: songs[index],
          index: index,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 28,
      ),
    );
  }
}
