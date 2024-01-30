// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Exam {
  String name;
  String examClass;
  String examType;
  String content;
  int questionNumber;
  int time;
  Exam({
    required this.name,
    required this.examClass,
    required this.examType,
    required this.content,
    required this.questionNumber,
    required this.time,
  });

  factory Exam.fromMap(Map<String, dynamic> map) {
    return Exam(
      name: map['name'] as String,
      examClass: map['examClass'] as String,
      examType: map['examType'] as String,
      content: map['content'] as String,
      questionNumber: map['questionNumber'] as int,
      time: map['time'] as int,
    );
  }

  factory Exam.fromJson(String source) =>
      Exam.fromMap(json.decode(source) as Map<String, dynamic>);
}
