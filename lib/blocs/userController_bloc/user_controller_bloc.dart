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
    on<LoginEvent>((event, emit) {
      firebaseAuthRepo.signIn(event.email, event.password);
    });

    on<SignInWithGoogle>((event, emit) {
      firebaseAuthRepo.signInWithGoogle();
    });

    on<LogoutEvent>((event, emit) {
      firebaseAuthRepo.logout();
    });

    on<RegisterEvent>((event, emit) {
      if (event.password == event.confirmPassword) {
        firebaseAuthRepo.register(event.email, event.password);
        Navigator.pop(event.context);
        ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(
          content: Text("Kayıt Olundu!"),
        ));
      } else {
        ScaffoldMessenger.of(event.context)
            .showSnackBar(SnackBar(content: Text("Parolalar Uyuşmuyor!")));
      }
    });

    on<ShowPassword>((event, emit) {
      emit(PasswordVisibility(isVisible: event.visibility));
    });

    on<ShowPasswordRegister>((event, emit) {
      emit(PasswordVisibilityRegister(isVisible: event.visibility));
    });

    on<ResetEvent>((event, emit) {
      emit(UserControllerInitial());
    });
  }
}
