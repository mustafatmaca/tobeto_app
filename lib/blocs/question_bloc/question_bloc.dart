import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/question_bloc/question_event.dart';
import 'package:tobeto_app/blocs/question_bloc/question_state.dart';
import 'package:tobeto_app/repository/firestore_repo.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  FireStoreRepo fireStoreRepo;
  QuestionBloc({required this.fireStoreRepo}) : super(QuestionInitial()) {
    on<LoadQuestion>((event, emit) async {
      emit(QuestionLoading());
      try {
        final questionList = await fireStoreRepo.getQuestions(event.examName);
        emit(QuestionLoaded(question: questionList));
      } catch (e) {
        emit(QuestionError());
      }
    });

    on<ResetQuestion>((event, emit) async {
      emit(QuestionInitial());
    });
  }
}
