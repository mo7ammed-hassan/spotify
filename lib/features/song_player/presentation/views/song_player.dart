import 'package:flutter/material.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';

class SongPlayerView extends StatelessWidget {
  const SongPlayerView({super.key});

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
    );
  }
}
