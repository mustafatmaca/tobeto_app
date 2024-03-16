// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class QuestionEvent {}

class LoadQuestion extends QuestionEvent {
  String examName;

  LoadQuestion({
    required this.examName,
  });
}

class ResetQuestion extends QuestionEvent {}
