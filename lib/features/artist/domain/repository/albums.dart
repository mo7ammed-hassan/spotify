import 'package:dartz/dartz.dart';

abstract class AlbumsRepository {
  Future<Either> getAlbums();
  Future<Either> getArtistAlbums({required String artist});
  Future<Either> getAlbumSongs({required String artist});
}
