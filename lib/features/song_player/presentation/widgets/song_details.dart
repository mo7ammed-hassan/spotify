import 'package:flutter/material.dart';
import 'package:spotify/features/home/domain/entities/song.dart';

class SongDetails extends StatelessWidget {
  final SongEntity song;
  const SongDetails({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
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
            size: 34,
          ),
        ),
      ],
    );
  }
}
