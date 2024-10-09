import 'package:flutter/material.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/features/artist/domain/entities/album.dart';

class AlbumCard extends StatelessWidget {
  final AlbumEntity album;
  const AlbumCard({
    super.key,
    required this.album,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    '${AppURLs.albumsFireStorage}${album.artist}${AppURLs.playListCover}${album.artist}.jpeg?${AppURLs.mediaAlt}',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(
              album.artist,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
