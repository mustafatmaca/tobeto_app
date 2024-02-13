import 'package:tobeto_app/models/user.dart';

abstract class UserInfoEvent {}

class ResetEvent extends UserInfoEvent {}

class LoadUser extends UserInfoEvent {}

class UpdateAboutUser extends UserInfoEvent {
  UserModel userModel;
  UpdateAboutUser({
    required this.userModel,
  });
}
