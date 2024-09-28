import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/home/data/repository/song.dart';
import 'package:spotify/service_locator.dart';

class GetNewstSongsUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await getIt<SongRepositoryImpl>().getNewsSongs();
  }
}
