import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_event.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_state.dart';
import 'package:tobeto_app/repository/firestore_repo.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  FireStoreRepo fireStoreRepo;
  UserInfoBloc({required this.fireStoreRepo}) : super(UserInfoInitial()) {
    on<ResetEvent>((event, emit) {
      emit(UserInfoInitial());
    });

    on<LoadUser>((event, emit) async {
      emit(UserInfoLoading());

      try {
        final user = await fireStoreRepo.getUser();
        emit(UserInfoLoaded(userModel: user));
      } catch (e) {
        emit(UserInfoError());
      }
    });

    on<UpdateAboutUser>((event, emit) async {
      try {
        fireStoreRepo.updateUserAbout(event.userModel);
      } catch (e) {
        print(e);
      }
    });

    on<UpdateUserGraduate>((event, emit) async {
      try {
        fireStoreRepo.updateUserGraduate(event.userModel);
      } catch (e) {
        print(e);
      }
    });
  }
}
