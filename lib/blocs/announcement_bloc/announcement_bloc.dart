
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/announcement_bloc/announcement_event.dart';
import 'package:tobeto_app/blocs/announcement_bloc/announcement_state.dart';
import 'package:tobeto_app/repository/firestore_repo.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  FireStoreRepo fireStoreRepo;
  AnnouncementBloc({required this.fireStoreRepo}) : super(AnnouncementInitial()) {
    on<LoadAnno>((event, emit) async {
      emit(AnnouncementLoading());
      try {
      final annoList = await  fireStoreRepo.getAnnouncements();
      emit(AnnouncementLoaded(announcementList: annoList));
      } catch (e) {
        emit(AnnouncementError());
      }
    });
  }
}
