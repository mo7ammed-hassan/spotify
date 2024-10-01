import 'package:dartz/dartz.dart';
import 'package:spotify/features/auth/data/models/create_user_req.dart';
import 'package:spotify/features/auth/data/models/signin_user_req.dart';
import 'package:spotify/features/auth/data/sources/auth_firebase_service.dart';
import 'package:spotify/features/auth/domain/repository/auth.dart';
import 'package:spotify/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await getIt<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await getIt<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either> getUserData() async {
    return await getIt<AuthFirebaseService>().getUserData();
  }
}
