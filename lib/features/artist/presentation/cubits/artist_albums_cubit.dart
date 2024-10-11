import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/artist/domain/use_case/get_artist_alums.dart';
import 'package:spotify/features/artist/presentation/cubits/artist_albums_state.dart';
import 'package:spotify/service_locator.dart';

class ArtistAlbumsCubit extends Cubit<ArtistAlbumsState> {
  ArtistAlbumsCubit() : super(ArtistAlbumsLoading());

  Future<void> fetchArtistAlbums({required String artist}) async {
    var result = await getIt<GetArtistAlbumsUseCase>().call(params: artist);

    result.fold(
      (l) {
        emit(
          ArtistAlbumsFailure(),
        );
      },
      (artistAlbums) {
        emit(
          ArtistAlbumsLoaded(artistAlbums: artistAlbums),
        );
      },
    );
  }
}
