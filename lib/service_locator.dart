import 'package:get_it/get_it.dart';
import 'package:spotify/features/auth/data/repository/auth_repository_impl.dart';
import 'package:spotify/features/auth/data/sources/auth_firebase_service.dart';
import 'package:spotify/features/auth/domain/repository/auth.dart';
import 'package:spotify/features/auth/domain/use_cases/signin.dart';
import 'package:spotify/features/auth/domain/use_cases/signup.dart';
import 'package:spotify/features/home/data/repository/song.dart';
import 'package:spotify/features/home/domain/repository/song_repository.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Register services
  getIt.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
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
}
