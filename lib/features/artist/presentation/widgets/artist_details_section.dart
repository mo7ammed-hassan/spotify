import 'package:flutter/material.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/features/artist/domain/entities/album.dart';

class ArtistDetailsSection extends StatelessWidget {
  final AlbumEntity albumEntity;
  const ArtistDetailsSection({super.key, required this.albumEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.33,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(60),
              bottomLeft: Radius.circular(60),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                '${AppURLs.albumsFireStorage}${albumEntity.artist}${AppURLs.playListCover}${albumEntity.artist}.jpeg?${AppURLs.mediaAlt}',
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          albumEntity.artist,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8),
        const Text(
          '1 Album , 67 Track',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Turpis adipiscing vestibulum orci enim, nascetur vitae ',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
