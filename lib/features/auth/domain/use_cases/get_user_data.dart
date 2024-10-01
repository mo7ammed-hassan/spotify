import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/features/auth/domain/repository/auth.dart';
import 'package:spotify/service_locator.dart';

class GetUserDataUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await getIt<AuthRepository>().getUserData();
  }
}
