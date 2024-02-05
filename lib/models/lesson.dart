// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Lesson {
  final String education;
  final String instructor;
  final Timestamp date;
  Lesson({
    required this.education,
    required this.instructor,
    required this.date,
  });

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      education: map['education'] as String,
      instructor: map['instructor'] as String,
      date: map['date'],
    );
  }

  factory Lesson.fromJson(String source) =>
      Lesson.fromMap(json.decode(source) as Map<String, dynamic>);
}
