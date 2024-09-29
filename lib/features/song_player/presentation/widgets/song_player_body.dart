import 'package:flutter/material.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/features/home/domain/entities/song.dart';

class SongPlayerBody extends StatelessWidget {
  final SongEntity song;
  final int index;
  const SongPlayerBody({super.key, required this.song, required this.index});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: [
          Hero(
            tag: index,
            child: AspectRatio(
              aspectRatio: 335 / 370,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      '${AppUrls.firestorage}${song.artist}$index.jpeg?${AppUrls.mediaAlt}',
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          _songDetails(song: song),
        ],
      ),
    );
  }

  Widget _songDetails({required SongEntity song}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              song.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              song.artist,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_outline,
            color: Color(0xff565656),
            size: 30,
          ),
        ),
      ],
    );
  }
}
