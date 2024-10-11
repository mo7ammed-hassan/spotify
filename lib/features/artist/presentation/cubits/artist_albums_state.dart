import 'package:spotify/features/artist/domain/entities/album.dart';

abstract class ArtistAlbumsState {}

class ArtistAlbumsLoading extends ArtistAlbumsState {}

class ArtistAlbumsLoaded extends ArtistAlbumsState {
  final List<AlbumEntity> artistAlbums;

  ArtistAlbumsLoaded({required this.artistAlbums});
}

class ArtistAlbumsFailure extends ArtistAlbumsState {}
