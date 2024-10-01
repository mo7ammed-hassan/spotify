import 'package:flutter/material.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/common/helper/navigator.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/features/home/domain/entities/song.dart';
import 'package:spotify/features/song_player/presentation/views/song_player.dart';

class NewsSongsListView extends StatelessWidget {
  const NewsSongsListView({super.key, required this.songs});
  final List<SongEntity> songs;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox(width: 14),
      itemCount: songs.length,
      padding: const EdgeInsets.only(left: 10),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.push(
              SongPlayerView(
                song: songs[index],
                index: index,
              ),
            );
          },
          child: SizedBox(
            width: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Hero(
                    tag: index,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            '${AppURLs.coverFireStorage}${songs[index].artist}$index.jpeg?${AppURLs.mediaAlt}',
                          ),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: _playSoundIcon(context),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  songs[index].title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  songs[index].artist,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _playSoundIcon(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      transform: Matrix4.translationValues(-8, 10, 0),
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
