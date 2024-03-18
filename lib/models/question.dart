import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Question {
  String examName;
  String question;
  String correctAnswer;
  Map<String, dynamic> answers;

  Question({
    required this.examName,
    required this.question,
    required this.correctAnswer,
    required this.answers,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'examName': examName,
      'question': question,
      'answers': answers,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      examName: map['examName'] as String,
      question: map['question'] as String,
      correctAnswer: map['correctAnswer'] as String,
      answers: map['answers'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source) as Map<String, dynamic>);
}
