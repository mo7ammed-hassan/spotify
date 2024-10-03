import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/profile/presentation/cubits/favorite_songs_cubit.dart';
import 'package:spotify/features/profile/presentation/cubits/favorite_songs_state.dart';
import 'package:spotify/features/profile/presentation/widgets/favorite_song_list_view.dart';

class FavoriteSongs extends StatelessWidget {
  const FavoriteSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteSongsCubit()..getUserFavoriteSongs(),
      child: BlocBuilder<FavoriteSongsCubit, FavoriteSongsState>(
        builder: (context, state) {
          if (state is FavoriteSongsLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
          if (state is FavoriteSongsLoaded) {
            return FavoriteSongsListView(
              songs: state.favoriteSongs,
            );
          }
          return Container();
        },
      ),
    );
  }
}
