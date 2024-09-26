import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/auth/data/models/auth/create_user_req.dart';
import 'package:spotify/features/auth/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    return getIt<AuthRepository>().signup(params!);
  }
}
