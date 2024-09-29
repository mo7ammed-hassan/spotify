import 'package:spotify/features/home/domain/entities/song.dart';

abstract class PlayListState {}

class PlayListLoading extends PlayListState {}

class PlayListLoaded extends PlayListState {
  final List<SongEntity> songs;

  PlayListLoaded({required this.songs});
}

class PlayListLoadedFailure extends PlayListState {}
