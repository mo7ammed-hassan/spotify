import 'package:spotify/features/artist/domain/entities/album.dart';

class AlbumModel {
  String? artist;

  AlbumModel(this.artist);

  AlbumModel.fromJson(Map<String, dynamic> data) {
    artist = data['artist'];
  }
}

extension AlbumModelX on AlbumModel {
  AlbumEntity toEntity() {
    return AlbumEntity(
      artist: artist!,
    );
  }
}
