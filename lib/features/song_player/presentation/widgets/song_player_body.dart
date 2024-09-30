import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/features/home/domain/entities/song.dart';
import 'package:spotify/features/song_player/presentation/cubits/song_player_cubit.dart';
import 'package:spotify/features/song_player/presentation/widgets/song_details.dart';
import 'package:spotify/features/song_player/presentation/widgets/song_player.dart';

class SongPlayerBody extends StatelessWidget {
  final SongEntity song;
  final int index;
  const SongPlayerBody({super.key, required this.song, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SongPlayerCubit()
        ..loadSong(
          '${AppUrls.songFireStorage}${song.artist} - ${song.title}.mp3?${AppUrls.mediaAlt}',
        ),
      child: SingleChildScrollView(
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
                        '${AppUrls.coverFireStorage}${song.artist}$index.jpeg?${AppUrls.mediaAlt}',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            SongDetails(song: song),
            const SizedBox(
              height: 30,
            ),
            const SongPlayer(),
          ],
        ),
      ),
    );
  }
}
