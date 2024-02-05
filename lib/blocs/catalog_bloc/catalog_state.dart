// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tobeto_app/models/catalog.dart';

abstract class CatalogState {}

class CatalogInitial extends CatalogState {}

class CatalogLoading extends CatalogState {}

class CatalogLoaded extends CatalogState {
  List<Catalog> catalogs;

  CatalogLoaded({
    required this.catalogs,
  });
}

class CatalogError extends CatalogState {}
