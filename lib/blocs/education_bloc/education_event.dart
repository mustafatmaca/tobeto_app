// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class EducationEvent {}

class LoadEducation extends EducationEvent {}

class LoadEducationByTitle extends EducationEvent {
  String title;

  LoadEducationByTitle({
    required this.title,
  });
}

class UpdateEduStatus extends EducationEvent {
  String id;
  int state;

  UpdateEduStatus({
    required this.id,
    required this.state,
  });
}

class ResetEvent extends EducationEvent {}
