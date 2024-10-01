import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/features/auth/data/sources/auth_firebase_service.dart';
import 'package:spotify/features/profile/presentation/cubits/profile_info_state.dart';
import 'package:spotify/service_locator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoLoading());

  Future<void> getUserData() async {
    var result = await getIt<AuthFirebaseService>().getUserData();

    result.fold(
      (l) {
        emit(ProfileInfoFaliure());
      },
      (user) {
        emit(ProfileInfoLoaded(user: user));
      },
    );
  }
}
