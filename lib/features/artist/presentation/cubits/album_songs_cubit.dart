import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/artist/domain/use_case/get_album_songs.dart';
import 'package:spotify/features/artist/presentation/cubits/album_songs_state.dart';
import 'package:spotify/service_locator.dart';

class AlbumSongsCubit extends Cubit<AlbumSongsState> {
  AlbumSongsCubit() : super(AlbumSongsLoading());

  Future<void> fetchAlbumSongs({required String artist}) async {
    var result = await getIt<GetAlbumSongsUseCase>().call(params: artist);

    result.fold(
      (l) {
        emit(
          AlbumSongsFailure(),
        );
      },
      (songs) {
        emit(
          AlbumSongsLoaded(albumSongs: songs),
        );
      },
    );
  }
}
