import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/features/home/domain/entities/song.dart';

class SongModel {
  String? title;
  String? artist;
  num? duration;
  Timestamp? releaseDate;
  bool? isFavorite;
  String? songId;

  SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.isFavorite,
    required this.songId,
  });

  SongModel.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
  }
}

// convert song model to song entity
extension SongModelX on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title ?? '',
      artist: artist ?? '',
      duration: duration ?? 0.0,
      releaseDate: releaseDate ?? Timestamp.now(),
      isFavorite: isFavorite ?? false,
      songId: songId!,
    );
  }
}
