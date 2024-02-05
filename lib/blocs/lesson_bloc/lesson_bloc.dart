import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/lesson_bloc/lesson_event.dart';
import 'package:tobeto_app/blocs/lesson_bloc/lesson_state.dart';
import 'package:tobeto_app/repository/firestore_repo.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  FireStoreRepo fireStoreRepo;
  LessonBloc({required this.fireStoreRepo}) : super(LessonInitial()) {
    on<LoadLessons>((event, emit) async {
      emit(LessonLoading());
      try {
        final lessonList = await fireStoreRepo.getLessons();
        emit(LessonLoaded(lessons: lessonList));
      } catch (e) {
        emit(LessonError());
      }
    });
  }
}
