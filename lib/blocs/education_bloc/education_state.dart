import '../../models/education.dart';

abstract class EducationState {}

final class EducationInitial extends EducationState {}

final class EducationLoading extends EducationState {}

final class EducationLoaded extends EducationState {
  final List<Education> educationList;

  EducationLoaded({required this.educationList});
}

final class EducationError extends EducationState {}
