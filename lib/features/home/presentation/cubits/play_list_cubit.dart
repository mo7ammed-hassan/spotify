import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/home/domain/use_cases/get_play_list.dart';
import 'package:spotify/features/home/presentation/cubits/play_list_state.dart';
import 'package:spotify/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  void fetchPlayLists() async {
    var returnedSongs = await getIt<GetPlayListUseCase>().call();

    returnedSongs.fold(
      (l) {
        emit(PlayListLoadedFailure());
      },
      (data) {
        emit(PlayListLoaded(songs: data));
      },
    );
  }
}
