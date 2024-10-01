import 'package:flutter/material.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/common/widgets/button/favorite_button.dart';
import 'package:spotify/features/home/domain/entities/song.dart';
import 'package:spotify/features/song_player/presentation/views/song_player.dart';

class SongsPlayListListView extends StatelessWidget {
  final List<SongEntity> songs;
  const SongsPlayListListView({
    super.key,
    required this.songs,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: songs.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _playListSongCard(
          context,
          song: songs[index],
          index: index,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 28,
      ),
    );
  }

  Widget _playListSongCard(context,
      {required SongEntity song, required int index}) {
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
              _playSoundIcon(context),
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
              FavoriteButton(
                song: song,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _playSoundIcon(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.isDarkMode
            ? const Color(0xff2C2C2C)
            : const Color(0xffE6E6E6),
      ),
      child: Icon(
        Icons.play_arrow_rounded,
        color: context.isDarkMode
            ? const Color(0xff959595)
            : const Color(0xff555555),
      ),
    );
  }
}
