import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/artist/presentation/cubits/album_songs_cubit.dart';
import 'package:spotify/features/artist/presentation/cubits/album_songs_state.dart';
import 'package:spotify/features/home/presentation/widgets/songs_play_list.dart';

class ArtistSongs extends StatelessWidget {
  const ArtistSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AlbumSongsCubit()..fetchAlbumSongs(artist: 'Tareq Mohamed'),
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
            return SongsPlayListListView(songs: state.albumSongs);
          }

          return SliverToBoxAdapter(child: Container());
        },
      ),
    );
  }
}
