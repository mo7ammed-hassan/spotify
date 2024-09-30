import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/song_player/presentation/cubits/song_player_state.dart';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  SongPlayerCubit() : super(SongPlayerLoading());
}
