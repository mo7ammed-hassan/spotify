import 'package:flutter/material.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/features/home/presentation/widgets/play_list_songs.dart';

class PlayListSection extends StatelessWidget {
  const PlayListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Playlist',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'See More',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color:context.isDarkMode ? const Color(0xffC6C6C6): const Color(0xff131313),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SongsPlayList(),
        ],
      ),
    );
  }
}
