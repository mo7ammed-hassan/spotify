import 'package:get_it/get_it.dart';
import 'package:spotify/features/auth/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/features/auth/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/features/auth/domain/repository/auth/auth.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Register services
  getIt.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );
}
