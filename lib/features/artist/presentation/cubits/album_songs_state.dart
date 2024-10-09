import 'package:spotify/features/home/domain/entities/song.dart';

abstract class AlbumSongsState {}

class AlbumSongsLoading extends AlbumSongsState {}

class AlbumSongsLoaded extends AlbumSongsState {
  final List<SongEntity> albumSongs;

  AlbumSongsLoaded({required this.albumSongs});
}

class AlbumSongsFailure extends AlbumSongsState {}
