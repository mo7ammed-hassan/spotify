import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/artist/domain/repository/albums.dart';
import 'package:spotify/service_locator.dart';

class GetArtistAlbumsUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await getIt<AlbumsRepository>().getArtistAlbums(artist: params!);
  }
}
