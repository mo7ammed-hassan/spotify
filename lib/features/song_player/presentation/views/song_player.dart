import 'package:flutter/material.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/features/home/domain/entities/song.dart';
import 'package:spotify/features/song_player/presentation/widgets/song_player_body.dart';

class SongPlayerView extends StatelessWidget {
  final SongEntity song;
  const SongPlayerView({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        action: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert_rounded,
            color: context.isDarkMode
                ? const Color(0xffDDDDDD)
                : const Color(0xff7D7D7D),
          ),
        ),
        title: const Text('Now playing'),
      ),
      body: SongPlayerBody(
        song: song,
      ),
    );
  }
}
