import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify/features/home/domain/entities/song.dart';
import 'package:spotify/features/home/domain/use_cases/get_favorites_songs.dart';
import 'package:spotify/features/profile/presentation/cubits/favorite_songs_state.dart';
import 'package:spotify/service_locator.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  FavoriteSongsCubit() : super(FavoriteSongsLoading());
  List<SongEntity> favoriteSongs = [];
  Future<void> getFavoriteSongs() async {
    var returnedSongs = await getIt<GetFavoriteSongsUseCase>().call();

    returnedSongs.fold(
      (l) {
        emit(FavoriteSongsFailure());
      },
      (data) {
        favoriteSongs = data;
        emit(FavoriteSongsLoaded(songs: favoriteSongs));
      },
    );
  }

  void removeFavoriteSong(int index) {
    favoriteSongs.removeAt(index);
    emit(FavoriteSongsLoaded(songs: favoriteSongs));
  }
}
