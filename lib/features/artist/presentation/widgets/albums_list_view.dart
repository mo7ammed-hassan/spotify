import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/artist/presentation/cubits/artist_albums_cubit.dart';
import 'package:spotify/features/artist/presentation/cubits/artist_albums_state.dart';
import 'package:spotify/features/artist/presentation/widgets/album_card.dart';

class AlbumsListview extends StatelessWidget {
  final String artist;
  const AlbumsListview({
    super.key,
    required this.artist,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ArtistAlbumsCubit()..fetchArtistAlbums(artist: artist),
      child: BlocBuilder<ArtistAlbumsCubit, ArtistAlbumsState>(
        builder: (context, state) {
          if (state is ArtistAlbumsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ArtistAlbumsLoaded) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemCount: state.artistAlbums.length,
              padding: const EdgeInsets.only(left: 5),
              itemBuilder: (context, index) {
                return AlbumCard(
                  album: state.artistAlbums[index],
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
