import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/home/domain/repository/song.dart';
import 'package:spotify/service_locator.dart';

class GetAlbumSongsUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await getIt<SongRepository>().getAlbumSongs(artist: params!);
  }
}
