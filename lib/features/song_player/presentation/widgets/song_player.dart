import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helper/is_dark_mode.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
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
                onChanged: (value) {
                  context.read<SongPlayerCubit>().updateTemporaryPosition(
                        Duration(
                          seconds: value.toInt(),
                        ),
                      );
                },
                onChangeEnd: (value) {
                  // Seek the audio to the new position when the user finishes adjusting
                  context
                      .read<SongPlayerCubit>()
                      .seekAudio(Duration(seconds: value.toInt()));
                },
                activeColor:
                    context.isDarkMode ? Colors.white : const Color(0xff434343),
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
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<SongPlayerCubit>().repeatSong();
                    },
                    child: SvgPicture.asset(
                      AppVectors.repeat,
                      width: 19,
                      colorFilter: ColorFilter.mode(
                        context.isDarkMode
                            ? const Color(0xff6D6D6D)
                            : const Color(0xff7E7E7E),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<SongPlayerCubit>().playPreviousSong();
                    },
                    child: SvgPicture.asset(
                      AppVectors.playPrevious,
                      width: 18,
                      colorFilter: iconPalyerColor(context),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.read<SongPlayerCubit>().playSongOrPause();
                    },
                    child: Container(
                      height: 72,
                      width: 72,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                      child: Icon(
                        context.read<SongPlayerCubit>().audioPlayer.playing
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      AppVectors.playNext,
                      width: 18,
                      colorFilter: iconPalyerColor(context),
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      AppVectors.shuffle,
                      width: 19,
                      colorFilter: ColorFilter.mode(
                        context.isDarkMode
                            ? const Color(0xff6D6D6D)
                            : const Color(0xff7E7E7E),
                        BlendMode.srcIn,
                      ),
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

  ColorFilter iconPalyerColor(BuildContext context) {
    return ColorFilter.mode(
      context.isDarkMode ? const Color(0xffA7A7A7) : const Color(0xff363636),
      BlendMode.srcIn,
    );
  }

  String formatDuration(Duration duration) {
    int minutes = duration.inMinutes % 60;
    int seconds = duration.inSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
