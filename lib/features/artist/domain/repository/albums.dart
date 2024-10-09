import 'package:dartz/dartz.dart';

abstract class AlbumsRepository {
  Future<Either> getAlbums();
  Future<Either> getAlbumSongs({required String artist});
}
