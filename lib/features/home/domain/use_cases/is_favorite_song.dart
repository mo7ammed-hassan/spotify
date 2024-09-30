import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/home/domain/repository/song.dart';
import 'package:spotify/service_locator.dart';

class IsFavoriteSongUseCase extends UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await getIt<SongRepository>().isFavoriteSong(songId: params!);
  }
}
