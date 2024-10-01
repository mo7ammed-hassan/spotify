import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/cubits/favorite_button_cubit.dart';
import 'package:spotify/common/cubits/favorite_button_state.dart';
import 'package:spotify/features/home/domain/entities/song.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity song;
  final Function? function;
  const FavoriteButton({super.key, required this.song, this.function});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if (state is FavoriteButtonInitial) {
            return IconButton(
              onPressed: () async {
                await context
                    .read<FavoriteButtonCubit>()
                    .favoriteBttonUpdated(song.songId);

                if (function != null) {
                  function!();
                }
              },
              icon: Icon(
                song.isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_outline_rounded,
                color: const Color(0xffC8C8C8),
                size: 26,
              ),
            );
          }
          if (state is FavoriteButtonUpdated) {
            return IconButton(
              onPressed: () {
                context
                    .read<FavoriteButtonCubit>()
                    .favoriteBttonUpdated(song.songId);
              },
              icon: Icon(
                state.isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_outline_rounded,
                color: const Color(0xffC8C8C8),
                size: 26,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
