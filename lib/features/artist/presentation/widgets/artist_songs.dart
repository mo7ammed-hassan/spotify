import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/artist/presentation/cubits/album_songs_cubit.dart';
import 'package:spotify/features/artist/presentation/cubits/album_songs_state.dart';
import 'package:spotify/features/artist/presentation/widgets/artist_songs_list_view.dart';

class ArtistSongs extends StatelessWidget {
  final String artist;
  const ArtistSongs({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumSongsCubit()..fetchAlbumSongs(artist: artist),
      child: BlocBuilder<AlbumSongsCubit, AlbumSongsState>(
        builder: (context, state) {
          if (state is AlbumSongsLoading) {
            return SliverToBoxAdapter(
              child: Container(
                alignment: AlignmentDirectional.center,
                child: const CircularProgressIndicator(),
              ),
            );
          }

          if (state is AlbumSongsLoaded) {
            return ArtistSongsListView(songs: state.albumSongs);
          }

          return SliverToBoxAdapter(child: Container());
        },
      ),
    );
  }
}
