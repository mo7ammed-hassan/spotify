import 'package:flutter/material.dart';
import 'package:spotify/features/home/domain/entities/song.dart';

class NewsSongsListView extends StatelessWidget {
  const NewsSongsListView({super.key, required this.songs});
  final List<SongEntity> songs;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 160,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(''),
                  ),
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 14),
      itemCount: songs.length,
    );
  }
}
