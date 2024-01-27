// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Exam {
  String name;
  String examClass;
  int time;
  Exam({
    required this.name,
    required this.examClass,
    required this.time,
  });

  factory Exam.fromMap(Map<String, dynamic> map) {
    return Exam(
      name: map['name'] as String,
      examClass: map['examClass'] as String,
      time: map['time'],
    );
  }

  factory Exam.fromJson(String source) =>
      Exam.fromMap(json.decode(source) as Map<String, dynamic>);
}
