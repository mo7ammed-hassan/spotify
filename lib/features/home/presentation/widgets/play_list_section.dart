import 'package:flutter/material.dart';

class PlayListSection extends StatelessWidget {
  const PlayListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Playlist',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Playlist',
              style: TextStyle(fontSize: 12),
            ),
          ],
        )
      ],
    );
  }
}
