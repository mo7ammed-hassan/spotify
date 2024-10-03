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
    if (!isClosed) {
      emit(SongPalyerLoaded());
    }
  }

  void loadSong(String songUrl) async {
    try {
      await audioPlayer.setUrl(songUrl);
      if (!isClosed) {
        emit(SongPalyerLoaded());
      }
    } catch (e) {
      if (!isClosed) {
        emit(SongPlayerFailure());
      }
    }
  }

  void playSongOrPause() async {
    if (audioPlayer.playing) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
    if (isClosed) {
      emit(
        SongPalyerLoaded(),
      );
    }
  }

  void repeatSong() async {
    if (audioPlayer.playing) {
      audioPlayer.setLoopMode(LoopMode.all);
      audioPlayer.play();
    }
    if (isClosed) {
      emit(
        SongPalyerLoaded(),
      );
    }
  }

  void playNextSong() async {
    await audioPlayer.seekToNext();
    audioPlayer.play();
    if (isClosed) {
      emit(
        SongPalyerLoaded(),
      );
    }
  }

  void playPreviousSong() async {
    await audioPlayer.seekToPrevious();
    audioPlayer.play();
    if (isClosed) {
      emit(
        SongPalyerLoaded(),
      );
    }
  }

// Seek audio to a specific position
  void seekAudio(Duration newPosition) async {
    await audioPlayer.seek(newPosition);
    emit(SongPalyerLoaded());
  }

  // Temporarily update position during slider drag
  void updateTemporaryPosition(Duration newPosition) {
    audioPosition = newPosition;
    emit(SongPalyerLoaded());
  }

  // dispose audio palyer when bloc is close
  @override
  Future<void> close() {
    audioPlayer.dispose();
    return super.close();
  }
}
