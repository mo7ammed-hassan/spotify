import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/features/home/data/models/song.dart';
import 'package:spotify/features/home/domain/entities/song.dart';
import 'package:spotify/features/home/domain/use_cases/is_favorite_song.dart';
import 'package:spotify/service_locator.dart';

abstract class SongsFirebaseService {
  Future<Either> getNewsSongs();
  Future<Either> getPlayLists();
  Future<Either> addOrRemoveFavoriteSong({required String songId});
  Future<bool> isFavoriteSong({required String songId});
  Future<Either> getUserFavoriteSongs();
}

class SongsFirebaseServiceImpl extends SongsFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongEntity> songs = [];
      var response = await FirebaseFirestore.instance
          .collection('Songs')
          //.orderBy('releaseDate', descending: true)
          .limit(3)
          .get();

      for (var element in response.docs) {
        var songModel = SongModel.fromJson(element.data());

        bool isFavorite = await getIt<IsFavoriteSongUseCase>().call(
          params: element.reference.id,
        );
        songModel.isFavorite = isFavorite;
        songModel.songId = element.reference.id;

        songs.add(
          songModel.toEntity(),
        );
      }
      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, Please try again.');
    }
  }

  @override
  Future<Either> getPlayLists() async {
    try {
      List<SongEntity> songs = [];
      var response = await FirebaseFirestore.instance
          .collection('Songs')
          //.orderBy('releaseDate', descending: true)
          .get();

      for (var element in response.docs) {
        // parse json format to dart object (song model)
        var songModel = SongModel.fromJson(element.data());

        bool isFavorite = await getIt<IsFavoriteSongUseCase>().call(
          params: element.reference.id,
        );
        songModel.isFavorite = isFavorite;
        songModel.songId = element.reference.id;

        // use fun that convert song model to song entity
        songs.add(
          songModel.toEntity(),
        );
      }
      return Right(songs);
    } catch (e) {
      return const Left('An error occurred, Please try again.');
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteSong({required String songId}) async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      late bool isFavorite;
      var user = firebaseAuth.currentUser;

      String uId = user!.uid;
      QuerySnapshot favoriteSongs = await firebaseFirestore
          .collection('Users')
          .doc(uId)
          .collection('Favorites')
          .where(
            'songId',
            isEqualTo: songId,
          )
          .get();

      if (favoriteSongs.docs.isNotEmpty) {
        await favoriteSongs.docs.first.reference.delete();
        isFavorite = false;
      } else {
        await firebaseFirestore
            .collection('Users')
            .doc(uId)
            .collection('Favorites')
            .add({
          'songId': songId,
          'addedDate': Timestamp.now(),
        });
        isFavorite = true;
      }
      return Right(isFavorite);
    } catch (e) {
      return const Left('An error occurred, Please try again.');
    }
  }

  @override
  Future<bool> isFavoriteSong({required String songId}) async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = firebaseAuth.currentUser;

      String uId = user!.uid;
      QuerySnapshot favoriteSongs = await firebaseFirestore
          .collection('Users')
          .doc(uId)
          .collection('Favorites')
          .where(
            'songId',
            isEqualTo: songId,
          )
          .get();

      if (favoriteSongs.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      var user = firebaseAuth.currentUser;

      String uId = user!.uid;

      List<SongEntity> favoriteSongs = [];

      QuerySnapshot favoriteSnapshot = await firebaseFirestore
          .collection('Users')
          .doc(uId)
          .collection('Favorites')
          .get();

      for (var element in favoriteSnapshot.docs) {
        String songId = element['songId'];
        var song =
            await firebaseFirestore.collection('Songs').doc(songId).get();
        var songModel = SongModel.fromJson(song.data()!);
        songModel.isFavorite = true;
        songModel.songId = songId;
        favoriteSongs.add(
          songModel.toEntity(),
        );
      }

      return Right(favoriteSongs);
    } catch (e) {
      return const Left('An error occurred, Please try again.');
    }
  }
}
