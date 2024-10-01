import 'package:dartz/dartz.dart';
import 'package:spotify/features/home/data/sources/songs_firebase_service.dart';
import 'package:spotify/features/home/domain/repository/song.dart';
import 'package:spotify/service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await getIt<SongsFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await getIt<SongsFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFavoriteSong({required String songId}) async {
    return await getIt<SongsFirebaseService>()
        .addOrRemoveFavoriteSong(songId: songId);
  }

  @override
  Future<bool> isFavoriteSong({required String songId}) async {
    return await getIt<SongsFirebaseService>().isFavoriteSong(songId: songId);
  }

  @override
  Future<Either> getFavoriteSongs() async {
    return await getIt<SongsFirebaseService>().getFavoriteSongs();
  }
}
