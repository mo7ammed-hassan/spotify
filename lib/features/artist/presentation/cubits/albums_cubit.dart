import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/artist/domain/use_case/get_albums.dart';
import 'package:spotify/features/artist/presentation/cubits/albums_state.dart';
import 'package:spotify/service_locator.dart';

class AlbumsCubit extends Cubit<AlbumsState> {
  AlbumsCubit() : super(AlbumsLoading());

  Future<void> fetchAlbums() async {
    var result = await getIt<GetAlbumsUseCase>().call();

    result.fold(
      (l) {
        emit(
          AlbumsFailure(),
        );
      },
      (albums) {
        emit(
          AlbumsLoaded(albums: albums),
        );
      },
    );
  }
}
