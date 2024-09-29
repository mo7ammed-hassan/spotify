import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/home/domain/repository/song.dart';
import 'package:spotify/service_locator.dart';

class GetPlayListUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await getIt<SongRepository>().getPlayList();
  }
}
