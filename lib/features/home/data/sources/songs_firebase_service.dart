import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/features/home/data/models/song.dart';
import 'package:spotify/features/home/domain/entities/song.dart';

abstract class SongsFirebaseService {
  Future<Either> getNewsSongs();
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
        // parse json format to dart object (song model)
        var songModel = SongModel.fromJson(element.data());
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
}
