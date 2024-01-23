import 'package:tobeto_app/models/application.dart';

abstract class ApplicationState {}

final class ApplicationInitial extends ApplicationState {}

final class ApplicationLoading extends ApplicationState {}

final class ApplicationLoaded extends ApplicationState {
  final List<Application> applicationList;

  ApplicationLoaded({required this.applicationList});
}

final class ApplicationError extends ApplicationState {}
