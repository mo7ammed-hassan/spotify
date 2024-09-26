import 'package:dartz/dartz.dart';
import 'package:spotify/features/auth/data/models/auth/create_user_req.dart';
import 'package:spotify/features/auth/data/models/auth/signin_user_req.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq signinUserReq);
}
