import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/artist/presentation/cubits/albums_state.dart';

class AlbumsCubit extends Cubit<AlbumsState> {
  AlbumsCubit() : super(AlbumsLoading());
}
