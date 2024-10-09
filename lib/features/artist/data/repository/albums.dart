import 'package:dartz/dartz.dart';
import 'package:spotify/features/artist/domain/repository/albums.dart';
import 'package:spotify/features/home/data/sources/songs_firebase_service.dart';
import 'package:spotify/service_locator.dart';

class AlbumsRepositoryImpl extends AlbumsRepository {
  @override
  Future<Either> getAlbums() async {
    return await getIt<SongsFirebaseService>().getAlbums();
  }

  @override
  Future<Either> getAlbumSongs({required String artist}) async {
    return await getIt<SongsFirebaseService>()
        .getAlbumSongs(artistName: artist);
  }
}
