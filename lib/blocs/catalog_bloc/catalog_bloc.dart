import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/catalog_bloc/catalog_event.dart';
import 'package:tobeto_app/blocs/catalog_bloc/catalog_state.dart';
import 'package:tobeto_app/repository/firestore_repo.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  FireStoreRepo fireStoreRepo;
  CatalogBloc({required this.fireStoreRepo}) : super(CatalogInitial()) {
    on<LoadCatalog>((event, emit) async {
      emit(CatalogLoading());
      try {
        final catalogList = await fireStoreRepo.getCatalog();
        emit(CatalogLoaded(catalogs: catalogList));
      } catch (e) {
        emit(CatalogError());
      }
    });

    on<LoadCatalogByTitle>((event, emit) async {
      emit(CatalogLoading());
      try {
        final catalogList = await fireStoreRepo.getCatalogByTitle(event.title);
        emit(CatalogLoaded(catalogs: catalogList));
      } catch (e) {
        emit(CatalogError());
      }
    });
  }
}
