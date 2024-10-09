import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/artist/presentation/cubits/albums_cubit.dart';
import 'package:spotify/features/artist/presentation/cubits/albums_state.dart';
import 'package:spotify/features/artist/presentation/widgets/album_card.dart';

class AlbumsListview extends StatelessWidget {
  const AlbumsListview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumsCubit()..fetchAlbums(),
      child: BlocBuilder<AlbumsCubit, AlbumsState>(
        builder: (context, state) {
          if (state is AlbumsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AlbumsLoaded) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemCount: state.albums.length,
              padding: const EdgeInsets.only(left: 5),
              itemBuilder: (context, index) {
                return AlbumCard(
                  album: state.albums[index],
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
