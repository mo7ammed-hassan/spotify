import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/auth/data/models/auth/signin_user_req.dart';
import 'package:spotify/features/auth/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class SigninUseCase extends UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async{
    return await getIt<AuthRepository>().signin(params!);
  }
  
}
