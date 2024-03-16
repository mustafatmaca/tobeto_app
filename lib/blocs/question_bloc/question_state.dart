import 'package:tobeto_app/models/question.dart';

abstract class QuestionState {}

final class QuestionInitial extends QuestionState {}

final class QuestionLoading extends QuestionState {}

final class QuestionLoaded extends QuestionState {
  final List<Question> question;

  QuestionLoaded({required this.question});
}

final class QuestionError extends QuestionState {}
