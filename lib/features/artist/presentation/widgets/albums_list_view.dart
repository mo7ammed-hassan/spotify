import 'package:flutter/material.dart';
import 'package:spotify/features/artist/presentation/widgets/album_card.dart';

class AlbumsListview extends StatelessWidget {
  const AlbumsListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox(width: 16),
      itemCount: 5,
      padding: const EdgeInsets.only(left: 5),
      itemBuilder: (context, index) {
        return const AlbumCard();
      },
    );
  }
}
