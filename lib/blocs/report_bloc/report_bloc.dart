import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/report_bloc/report_event.dart';
import 'package:tobeto_app/blocs/report_bloc/report_state.dart';
import 'package:tobeto_app/repository/firestore_repo.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  FireStoreRepo fireStoreRepo;
  ReportBloc({required this.fireStoreRepo}) : super(ReportInitial()) {
    on<LoadReport>((event, emit) async {
      emit(ReportLoading());
      try {
        final reports = await fireStoreRepo.getReports();
        emit(ReportLoaded(report: reports));
      } catch (e) {
        emit(ReportError());
      }
    });
  }
}
