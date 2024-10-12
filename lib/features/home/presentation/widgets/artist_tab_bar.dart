import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/artist/presentation/cubits/albums_cubit.dart';
import 'package:spotify/features/artist/presentation/cubits/albums_state.dart';
import 'package:spotify/features/home/presentation/widgets/artist_list_view.dart';

class ArtistTabBar extends StatelessWidget {
  const ArtistTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumsCubit()..fetchAlbums(),
      child: SizedBox(
        height: 200,
        child: BlocBuilder<AlbumsCubit, AlbumsState>(
          builder: (context, state) {
            if (state is AlbumsLoading) {
              return Container(
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              );
            }
            if (state is AlbumsLoaded) {
              return ArtistListView(
                album: state.albums,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

