

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/exam_bloc/exam_event.dart';
import 'package:tobeto_app/blocs/exam_bloc/exam_state.dart';
import 'package:tobeto_app/repository/firestore_repo.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  FireStoreRepo fireStoreRepo;
  ExamBloc({required this.fireStoreRepo}) : super(ExamInitial()) {
    on<LoadExam>((event, emit) async {
      emit(ExamLoading());
      try {
       final examList = await fireStoreRepo.getExams();
       emit(ExamLoaded(examList: examList));
      } catch (e) {
        emit(ExamError());
      }
    });
  }
}
