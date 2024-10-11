import 'package:flutter/material.dart';
import 'package:spotify/features/artist/domain/entities/album.dart';
import 'package:spotify/features/artist/presentation/widgets/albums_list_view.dart';
import 'package:spotify/features/artist/presentation/widgets/artist_details_section.dart';
import 'package:spotify/features/artist/presentation/widgets/artist_songs.dart';

class ArtistViewBody extends StatelessWidget {
  final AlbumEntity albumEntity;
  const ArtistViewBody({super.key, required this.albumEntity});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: ArtistDetailsSection(
          albumEntity: albumEntity,
        )),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
        const SliverToBoxAdapter(
          child: Text(
            'Albums',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 25,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 160,
            child: AlbumsListview(
              artist: albumEntity.artist,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 35,
          ),
        ),
        const SliverToBoxAdapter(
          child: Text(
            'Songs',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 18)),
        ArtistSongs(
          artist: albumEntity.artist,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 5)),
      ],
    );
  }
}
