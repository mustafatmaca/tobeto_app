// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tobeto_app/models/lesson.dart';

abstract class LessonState {}

class LessonInitial extends LessonState {}

class LessonLoading extends LessonState {}

class LessonLoaded extends LessonState {
  List<Lesson> lessons;

  LessonLoaded({
    required this.lessons,
  });
}

class LessonError extends LessonState {}
