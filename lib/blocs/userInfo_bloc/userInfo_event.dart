import 'dart:io';

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

class UpdateUserGraduate extends UserInfoEvent {
  UserModel userModel;
  UpdateUserGraduate({
    required this.userModel,
  });
}

class UpdateUserExperience extends UserInfoEvent {
  UserModel userModel;
  UpdateUserExperience({
    required this.userModel,
  });
}

class UpdateUserSkill extends UserInfoEvent {
  UserModel userModel;
  UpdateUserSkill({
    required this.userModel,
  });
}

class UpdateUserLanguage extends UserInfoEvent {
  UserModel userModel;
  UpdateUserLanguage({
    required this.userModel,
  });
}

class UpdateUserSocial extends UserInfoEvent {
  UserModel userModel;
  UpdateUserSocial({
    required this.userModel,
  });
}

class UpdateUserCertificate extends UserInfoEvent {
  UserModel userModel;
  File file;
  UpdateUserCertificate({
    required this.userModel,
    required this.file,
  });
}
