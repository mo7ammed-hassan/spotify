import 'package:get_it/get_it.dart';
import 'package:spotify/features/auth/data/repository/auth_repository_impl.dart';
import 'package:spotify/features/auth/data/sources/auth_firebase_service.dart';
import 'package:spotify/features/auth/domain/repository/auth.dart';
import 'package:spotify/features/auth/domain/use_cases/get_user_data.dart';
import 'package:spotify/features/auth/domain/use_cases/signin.dart';
import 'package:spotify/features/auth/domain/use_cases/signup.dart';
import 'package:spotify/features/home/data/repository/song.dart';
import 'package:spotify/features/home/data/sources/songs_firebase_service.dart';
import 'package:spotify/features/home/domain/repository/song.dart';
import 'package:spotify/features/home/domain/use_cases/add_or_remove_favorite_song.dart';
import 'package:spotify/features/home/domain/use_cases/get_favorites_songs.dart';
import 'package:spotify/features/home/domain/use_cases/get_albums.dart';
import 'package:spotify/features/home/domain/use_cases/get_news_songs.dart';
import 'package:spotify/features/home/domain/use_cases/get_play_list.dart';
import 'package:spotify/features/home/domain/use_cases/get_album_songs.dart';
import 'package:spotify/features/home/domain/use_cases/is_favorite_song.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Register services
  getIt.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  getIt.registerSingleton<SongsFirebaseService>(
    SongsFirebaseServiceImpl(),
  );

  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  getIt.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );

  getIt.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );

  getIt.registerSingleton<SongRepository>(
    SongRepositoryImpl(),
  );

  getIt.registerSingleton<GetNewstSongsUseCase>(
    GetNewstSongsUseCase(),
  );

  getIt.registerSingleton<GetPlayListUseCase>(
    GetPlayListUseCase(),
  );

  getIt.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
    AddOrRemoveFavoriteSongUseCase(),
  );

  getIt.registerSingleton<IsFavoriteSongUseCase>(
    IsFavoriteSongUseCase(),
  );

  getIt.registerSingleton<GetUserDataUseCase>(
    GetUserDataUseCase(),
  );

  getIt.registerSingleton<GetUserFavoriteSongsUseCase>(
    GetUserFavoriteSongsUseCase(),
  );

  getIt.registerSingleton<GetAlbumsUseCase>(
    GetAlbumsUseCase(),
  );

  getIt.registerSingleton<GetAlbumSongsUseCase>(
    GetAlbumSongsUseCase(),
  );
}
