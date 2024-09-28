import 'package:spotify/features/home/domain/entities/song.dart';

abstract class NewsSongsState {}

class NewsSongsLoading extends NewsSongsState {}

class NewsSongsLoaded extends NewsSongsState {
  final List<SongEntity> songs;

  NewsSongsLoaded({required this.songs});
}

class NewsSongsLoadFailure extends NewsSongsState {}
