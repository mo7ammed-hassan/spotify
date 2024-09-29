import 'package:flutter/material.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';

class SongPlayer extends StatelessWidget {
  const SongPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppBar(
        hideAction: false,
        title: Text('Now playing'),
      ),
    );
  }
}
