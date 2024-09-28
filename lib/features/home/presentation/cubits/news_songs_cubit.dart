import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:spotify/features/home/domain/use_cases/get_news_songs.dart';
import 'package:spotify/features/home/presentation/cubits/news_songs_state.dart';
import 'package:spotify/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await getIt<GetNewstSongsUseCase>().call();

    returnedSongs.fold(
      (l) {
        emit(NewsSongsLoadFailure());
      },
      (data) {
        emit(NewsSongsLoaded(songs: data));
      },
    );
  }
}
