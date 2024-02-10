import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_event.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_state.dart';
import 'package:tobeto_app/repository/firestore_repo.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  FireStoreRepo fireStoreRepo;
  UserInfoBloc({required this.fireStoreRepo}) : super(UserInfoInitial()) {
    on<LoadUser>((event, emit) async {
      emit(UserInfoLoading());

      try {
        final user = await fireStoreRepo.getUser();
        emit(UserInfoLoaded(userModel: user));
      } catch (e) {
        emit(UserInfoError());
      }
    });
  }
}
