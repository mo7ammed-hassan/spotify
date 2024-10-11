import 'package:flutter/material.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/features/artist/domain/entities/album.dart';
import 'package:spotify/features/artist/presentation/widgets/artist_view_body.dart';

class ArtistView extends StatelessWidget {
  final AlbumEntity albumEntity;
  const ArtistView({super.key, required this.albumEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
      ),
      body: ArtistViewBody(
        albumEntity: albumEntity,
      ),
    );
  }
}
