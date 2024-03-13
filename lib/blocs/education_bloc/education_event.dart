// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class EducationEvent {}

class LoadEducation extends EducationEvent {}

class LoadEducationByTitle extends EducationEvent {
  String title;

  LoadEducationByTitle({
    required this.title,
  });
}
