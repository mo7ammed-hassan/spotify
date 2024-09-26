import 'package:dartz/dartz.dart';
import 'package:spotify/features/auth/data/models/auth/create_user_req.dart';
import 'package:spotify/features/auth/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/features/auth/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await getIt<AuthFirebaseService>().signup(createUserReq);
  }
}
