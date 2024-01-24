abstract class UserControllerState {}

final class UserControllerInitial extends UserControllerState {}

final class PasswordVisibility extends UserControllerState {
  bool isVisible = false;

  PasswordVisibility({required this.isVisible});
}

final class PasswordVisibilityRegister extends UserControllerState {
  bool isVisible = false;

  PasswordVisibilityRegister({required this.isVisible});
}
