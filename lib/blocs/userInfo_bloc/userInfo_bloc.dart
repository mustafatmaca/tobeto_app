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
        fireStoreRepo.updateUserAbout(event.userModel, event.file);
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

    on<UpdateUserExperience>((event, emit) async {
      try {
        fireStoreRepo.updateUserExperience(event.userModel);
      } catch (e) {
        print(e);
      }
    });

    on<UpdateUserSkill>((event, emit) async {
      try {
        fireStoreRepo.updateUserSkill(event.userModel);
      } catch (e) {
        print(e);
      }
    });

    on<UpdateUserLanguage>((event, emit) async {
      try {
        fireStoreRepo.updateUserLanguage(event.userModel);
      } catch (e) {
        print(e);
      }
    });

    on<UpdateUserSocial>((event, emit) async {
      try {
        fireStoreRepo.updateUserSocial(event.userModel);
      } catch (e) {
        print(e);
      }
    });

    on<UpdateUserCertificate>((event, emit) async {
      try {
        fireStoreRepo.updateUserCertificate(event.userModel, event.file);
      } catch (e) {
        print(e);
      }
    });
  }
}
