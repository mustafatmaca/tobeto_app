import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/navigation_bloc/navigation_event.dart';
import 'package:tobeto_app/blocs/navigation_bloc/navigation_state.dart';
import 'package:tobeto_app/repository/firebaseAuth_repo.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final FirebaseAuthRepo firebaseAuthRepo;

  NavigationBloc({required this.firebaseAuthRepo})
      : super(NavigationInitial()) {
    on<ChangeScreen>((event, emit) {
      // TODO: implement event handler
      emit(NavigationLoaded(currentPage: event.index));
    });

    on<LoginEvent>((event, emit) {
      firebaseAuthRepo.signIn(event.email, event.password);
    });

    on<RegisterEvent>((event, emit) {
      firebaseAuthRepo.register(event.email, event.password);
    });
  }
}
