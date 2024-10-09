import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/artist/domain/repository/albums.dart';
import 'package:spotify/service_locator.dart';

class GetAlbumsUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await getIt<AlbumsRepository>().getAlbums();
  }
}
