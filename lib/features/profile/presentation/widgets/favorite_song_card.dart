import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/features/home/domain/entities/song.dart';
import 'package:spotify/features/profile/presentation/cubits/favorite_songs_cubit.dart';
import 'package:spotify/features/song_player/presentation/views/song_player.dart';

class FavoriteSongCard extends StatelessWidget {
  final SongEntity song;
  final int index;
  const FavoriteSongCard({super.key, required this.song, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SongPlayerView(
              song: song,
              index: index,
            ),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _favoriteSongImage(context, song: song),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    song.artist,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                song.duration.toString().replaceAll('.', ':'),
                style: const TextStyle(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                onPressed: () {
                  context.read<FavoriteSongsCubit>().removeFavoriteSong(index);
                },
                icon: Icon(
                  Icons.remove,
                  color: context.isDarkMode
                      ? const Color(0xffE4E4E4)
                      : const Color(0xffA68C8C),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _favoriteSongImage(context, {required SongEntity song}) {
    return Container(
      height: 56,
      width: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: NetworkImage(
            '${AppURLs.coverFireStorage}${song.artist} - ${song.title}.jpeg?${AppURLs.mediaAlt}',
          ),
        ),
      ),
    );
  }
}
