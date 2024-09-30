import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify/features/song_player/presentation/cubits/song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  AudioPlayer audioPlayer = AudioPlayer();

  Duration audioDuration = Duration.zero;
  Duration audioPosition = Duration.zero;

  SongPlayerCubit() : super(SongPlayerLoading()) {
    audioPlayer.positionStream.listen(
      (position) {
        audioPosition = position;
        updateSongPlayer();
      },
    );
    audioPlayer.durationStream.listen(
      (duration) {
        audioDuration = duration!;
      },
    );
  }

  void updateSongPlayer() {
    emit(
      SongPalyerLoaded(),
    );
  }

  void loadSong(String songUrl) async {
    try {
      await audioPlayer.setUrl(songUrl);
      emit(
        SongPalyerLoaded(),
      );
    } on Exception {
      emit(
        SongPlayerFailure(),
      );
    }
  }

  void playSongOrPause() async {
    if (audioPlayer.playing) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
    emit(
      SongPalyerLoaded(),
    );
  }

  // dispose audio palyer when bloc is close
  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
