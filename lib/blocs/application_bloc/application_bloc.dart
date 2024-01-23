import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/application_bloc/application_event.dart';
import 'package:tobeto_app/blocs/application_bloc/application_state.dart';
import 'package:tobeto_app/repository/firestore_repo.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final FireStoreRepo fireStoreRepo;

  ApplicationBloc({required this.fireStoreRepo}) : super(ApplicationInitial()) {
    on<LoadApplication>((event, emit) async {
      // TODO: implement event handler
      emit(ApplicationLoading());

      try {
        final applications = await fireStoreRepo.getApplications();
        emit(ApplicationLoaded(applicationList: applications));
      } catch (e) {
        emit(ApplicationError());
      }
    });
  }
}
