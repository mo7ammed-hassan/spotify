import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify/features/home/domain/entities/song.dart';
import 'package:spotify/features/home/domain/use_cases/get_favorites_songs.dart';
import 'package:spotify/features/profile/presentation/cubits/favorite_songs_state.dart';
import 'package:spotify/service_locator.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  FavoriteSongsCubit() : super(FavoriteSongsLoading());
  List<SongEntity> favoriteSongs = [];
  Future<void> getUserFavoriteSongs() async {
    var returnedSongs = await getIt<GetUserFavoriteSongsUseCase>().call();

    returnedSongs.fold(
      (l) {
        emit(FavoriteSongsFailure());
      },
      (r) {
        favoriteSongs = r;
        emit(FavoriteSongsLoaded(favoriteSongs: favoriteSongs));
      },
    );
  }

  void removeFavoriteSong(int index) {
    favoriteSongs.removeAt(index);
    emit(FavoriteSongsLoaded(favoriteSongs: favoriteSongs));
  }
}
