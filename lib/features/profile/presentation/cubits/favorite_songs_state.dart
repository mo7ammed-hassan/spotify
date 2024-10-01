import 'package:spotify/features/home/domain/entities/song.dart';

abstract class FavoriteSongsState {}

class FavoriteSongsLoading extends FavoriteSongsState {}

class FavoriteSongsLoaded extends FavoriteSongsState {
  final List<SongEntity> songs;

  FavoriteSongsLoaded({required this.songs});
}

class FavoriteSongsFailure extends FavoriteSongsState {}
