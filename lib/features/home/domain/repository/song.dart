import 'package:dartz/dartz.dart';

abstract class SongRepository {
  Future<Either> getNewsSongs();
  Future<Either> getPlayLists();
  Future<Either> addOrRemoveFavoriteSong({required String songId});
  Future<bool> isFavoriteSong({required String songId});
  Future<Either> getUserFavoriteSongs();
 
}
