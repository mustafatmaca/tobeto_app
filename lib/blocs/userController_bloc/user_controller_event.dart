// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

abstract class UserControllerEvent {}

class LoginEvent extends UserControllerEvent {
  String email;
  String password;
  BuildContext context;

  LoginEvent({
    required this.email,
    required this.password,
    required this.context,
  });
}

class SignInWithGoogle extends UserControllerEvent {}

class LogoutEvent extends UserControllerEvent {}

class RegisterEvent extends UserControllerEvent {
  String name;
  String surname;
  String email;
  String password;
  String confirmPassword;
  BuildContext context;

  RegisterEvent({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.context,
  });
}

class ForgotPasswordEvent extends UserControllerEvent {
  String email;
  BuildContext context;

  ForgotPasswordEvent({
    required this.email,
    required this.context,
  });
}

class ShowPassword extends UserControllerEvent {
  bool visibility;

  ShowPassword({
    required this.visibility,
  });
}

class ShowPasswordRegister extends UserControllerEvent {
  bool visibility;

  ShowPasswordRegister({
    required this.visibility,
  });
}

class UpdatePassword extends UserControllerEvent {
  String password;
  BuildContext context;

  UpdatePassword({
    required this.password,
    required this.context,
  });
}

class DeleteUser extends UserControllerEvent {}
