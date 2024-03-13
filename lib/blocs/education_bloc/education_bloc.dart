import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/education_bloc/education_event.dart';
import 'package:tobeto_app/blocs/education_bloc/education_state.dart';
import 'package:tobeto_app/repository/firestore_repo.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  final FireStoreRepo fireStoreRepo;

  EducationBloc({required this.fireStoreRepo}) : super(EducationInitial()) {
    on<LoadEducation>((event, emit) async {
      emit(EducationLoading());

      try {
        final educations = await fireStoreRepo.getEducations();
        emit(EducationLoaded(educationList: educations));
      } catch (e) {
        emit(EducationError());
      }
    });

    on<LoadEducationByTitle>((event, emit) async {
      emit(EducationLoading());

      try {
        final educations = await fireStoreRepo.getEducationByTitle(event.title);
        emit(EducationLoaded(educationList: educations));
      } catch (e) {
        emit(EducationError());
      }
    });
  }
}
