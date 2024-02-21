import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_event.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_state.dart';
import 'package:tobeto_app/repository/firebaseAuth_repo.dart';

class UserControllerBloc
    extends Bloc<UserControllerEvent, UserControllerState> {
  final FirebaseAuthRepo firebaseAuthRepo;
  UserControllerBloc({required this.firebaseAuthRepo})
      : super(UserControllerInitial()) {
    on<LoginEvent>((event, emit) async {
      final message =
          await firebaseAuthRepo.signIn(event.email, event.password);

      if (message != "Giriş Başarılı!") {
        ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
          content: Text(message),
        ));
      }
    });

    on<SignInWithGoogle>((event, emit) {
      firebaseAuthRepo.signInWithGoogle();
    });

    on<LogoutEvent>((event, emit) {
      firebaseAuthRepo.logout();
    });

    on<RegisterEvent>((event, emit) async {
      final message = await firebaseAuthRepo.register(event.name, event.surname,
          event.email, event.password, event.confirmPassword);

      if (message == "Kayıt Başarılı!") {
        Navigator.pop(event.context);
        ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
          content: Text(message),
        ));
      } else {
        ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
          content: Text(message),
        ));
      }
    });

    on<ForgotPasswordEvent>((event, emit) {
      firebaseAuthRepo.forgotPassword(event.email);
      ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
        content: Text("E-posta Gönderildi!"),
      ));
    });

    on<ShowPassword>((event, emit) {
      emit(PasswordVisibility(isVisible: event.visibility));
    });

    on<ShowPasswordRegister>((event, emit) {
      emit(PasswordVisibilityRegister(isVisible: event.visibility));
    });

    on<UpdatePassword>((event, emit) {
      try {
        firebaseAuthRepo.changePassword(event.password);
        ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(
          content: Text("Parola Güncellendi!"),
        ));
      } catch (e) {
        print(e);
      }
    });
  }
}
