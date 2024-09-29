import 'package:flutter/material.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/features/home/domain/entities/song.dart';

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
      itemCount: 3,
      itemBuilder: (context, index) {
        return _playListSongCard(
          context,
          song: songs[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 28,
      ),
    );
  }

  Widget _playListSongCard(context, {required SongEntity song}) {
    return Row(
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
                    fontSize: 16,
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
              onPressed: () {},
              icon:
                  const Icon(Icons.favorite_rounded, color: Color(0xff565656)),
            ),
          ],
        )
      ],
    );
  }

  Widget _playSoundIcon(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
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
