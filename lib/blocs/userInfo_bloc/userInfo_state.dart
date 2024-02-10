// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tobeto_app/models/user.dart';

abstract class UserInfoState {}

class UserInfoInitial extends UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UserInfoLoaded extends UserInfoState {
  UserModel userModel;

  UserInfoLoaded({
    required this.userModel,
  });
}

class UserInfoError extends UserInfoState {}
