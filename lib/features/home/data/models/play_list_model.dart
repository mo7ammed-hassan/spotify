import 'package:spotify/features/home/domain/entities/play_list_entitiy.dart';

class PlayListModel {
  String? artist;

  PlayListModel(this.artist);

  PlayListModel.fromJson(Map<String, dynamic> data) {
    artist = data['artist'];
  }
}

extension PlayListModelX on PlayListModel {
  PlayListEntitiy toEntity() {
    return PlayListEntitiy(
      artist: artist!,
    );
  }
}
