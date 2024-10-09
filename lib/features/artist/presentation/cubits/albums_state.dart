import 'package:spotify/features/home/domain/entities/album.dart';

abstract class AlbumsState {}

class AlbumsInitial extends AlbumsState {}

class AlbumsLoading extends AlbumsState {}

class AlbumsLoaded extends AlbumsState {
  final List<AlbumEntity> albums;

  AlbumsLoaded({required this.albums});
}
