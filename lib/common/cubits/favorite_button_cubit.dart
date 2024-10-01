import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/cubits/favorite_button_state.dart';
import 'package:spotify/features/home/domain/use_cases/add_or_remove_favorite_song.dart';
import 'package:spotify/service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  Future<void> favoriteBttonUpdated(String songId) async {
    var result =
        await getIt<AddOrRemoveFavoriteSongUseCase>().call(params: songId);

    result.fold(
      (l) {},
      (isFavorite) {
        emit(FavoriteButtonUpdated(isFavorite: isFavorite));
      },
    );
  }
}
