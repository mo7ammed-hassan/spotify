import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/song_player/presentation/cubits/song_player_cubit.dart';
import 'package:spotify/features/song_player/presentation/cubits/song_player_state.dart';

class SongPlayer extends StatelessWidget {
  const SongPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongPlayerCubit, SongPlayerState>(
      builder: (context, state) {
        if (state is SongPlayerLoading) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }
        if (state is SongPalyerLoaded) {
          return Column(
            children: [
              Slider(
                value: context
                    .read<SongPlayerCubit>()
                    .audioPosition
                    .inSeconds
                    .toDouble(),
                min: 0.0,
                max: context
                    .read<SongPlayerCubit>()
                    .audioDuration
                    .inSeconds
                    .toDouble(),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatDuration(
                      context.read<SongPlayerCubit>().audioPosition,
                    ),
                  ),
                  Text(
                    formatDuration(
                      context.read<SongPlayerCubit>().audioDuration,
                    ),
                  ),
                ],
              ),
            ],
          );
        }
        return Container();
      },
    );
  }

  String formatDuration(Duration duration) {
    int minutes = duration.inMinutes % 60;
    int seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
