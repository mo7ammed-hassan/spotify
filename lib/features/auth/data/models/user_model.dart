import 'package:spotify/features/auth/domain/entites/user.dart';

class UserModel {
  String? fullName;
  String? email;
  String? imageURL;

  UserModel({
    required this.fullName,
    required this.email,
    required this.imageURL,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    fullName = data['fullName'];
    email = data['email'];
    imageURL = data['imageURL'];
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      fullName: fullName,
      email: email,
      imageURL: imageURL,
    );
  }
}
