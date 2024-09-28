import 'package:dartz/dartz.dart';
import 'package:spotify/features/home/data/sources/songs_firebase_service.dart';
import 'package:spotify/features/home/domain/repository/song_repository.dart';
import 'package:spotify/service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await getIt<SongsFirebaseService>().getNewsSongs();
  }
}
