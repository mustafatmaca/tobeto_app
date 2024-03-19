import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/result_bloc/result_event.dart';
import 'package:tobeto_app/blocs/result_bloc/result_state.dart';
import 'package:tobeto_app/repository/firestore_repo.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  FireStoreRepo fireStoreRepo;
  ResultBloc({required this.fireStoreRepo}) : super(ResultInitial()) {
    on<LoadResult>((event, emit) async {
      emit(ResultLoading());
      try {
        final resultList = await fireStoreRepo.getResults(event.userId);
        emit(ResultLoaded(results: resultList));
      } catch (e) {
        emit(ResultError());
      }
    });

    on<AddResult>((event, emit) {
      fireStoreRepo.setResult(event.result);
    });

    on<ResetEvent>((event, emit) async {
      emit(ResultInitial());
    });
  }
}
