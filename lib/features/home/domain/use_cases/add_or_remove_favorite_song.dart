import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/home/domain/repository/song.dart';
import 'package:spotify/service_locator.dart';

class AddOrRemoveFavoriteSongUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await getIt<SongRepository>()
        .addOrRemoveFavoriteSong(songId: params!);
  }
}
