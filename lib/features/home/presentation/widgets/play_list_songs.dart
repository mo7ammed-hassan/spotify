import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/home/presentation/cubits/play_list_cubit.dart';
import 'package:spotify/features/home/presentation/cubits/play_list_state.dart';
import 'package:spotify/features/home/presentation/widgets/songs_play_list.dart';

class SongsPlayList extends StatelessWidget {
  const SongsPlayList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlayListCubit()..fetchPlayLists(),
      child: BlocBuilder<PlayListCubit, PlayListState>(
        builder: (context, state) {
          if (state is PlayListLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
          if (state is PlayListLoaded) {
            return SongsPlayListListView(
              songs: state.songs,
            );
          }

          return Container();
        },
      ),
    );
  }
}
