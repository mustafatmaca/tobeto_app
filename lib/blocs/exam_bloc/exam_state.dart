
import 'package:tobeto_app/models/exam.dart';

abstract class ExamState {}

final class ExamInitial extends ExamState {}


final class ExamLoading extends ExamState {}

final class ExamLoaded extends ExamState {
  final List<Exam> examList;

  ExamLoaded({required this.examList});
}

final class ExamError extends ExamState {}
