// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class NavigationEvent {}

class ChangeScreen extends NavigationEvent {
  int index;

  ChangeScreen({
    required this.index,
  });
}

class LoginEvent extends NavigationEvent {
  String email;
  String password;

  LoginEvent({
    required this.email,
    required this.password,
  });
}

class RegisterEvent extends NavigationEvent {
  String email;
  String password;

  RegisterEvent({
    required this.email,
    required this.password,
  });
}
