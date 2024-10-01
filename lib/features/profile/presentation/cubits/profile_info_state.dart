import 'package:spotify/features/auth/domain/entites/user.dart';

abstract class ProfileInfoState {}

// loading
class ProfileInfoLoading extends ProfileInfoState {}
// loadded

class ProfileInfoLoaded extends ProfileInfoState {
  final UserEntity user;

  ProfileInfoLoaded({required this.user});
}
