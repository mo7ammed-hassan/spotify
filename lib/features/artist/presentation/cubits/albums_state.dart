import 'package:spotify/features/artist/domain/entities/album.dart';

abstract class AlbumsState {}

class AlbumsLoading extends AlbumsState {}

class AlbumsLoaded extends AlbumsState {
  final List<AlbumEntity> albums;

  AlbumsLoaded({required this.albums});
}

class AlbumsFailure extends AlbumsState {}
