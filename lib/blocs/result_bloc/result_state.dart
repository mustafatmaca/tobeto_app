import 'package:tobeto_app/models/result.dart';

abstract class ResultState {}

final class ResultInitial extends ResultState {}

final class ResultLoading extends ResultState {}

final class ResultLoaded extends ResultState {
  List<Result> results;

  ResultLoaded({required this.results});
}

final class ResultError extends ResultState {}
