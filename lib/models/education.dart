import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Education {
  String title;
  Timestamp date;
  String image;
  String videoUrl;
  int state;
  Education({
    required this.title,
    required this.date,
    required this.image,
    required this.videoUrl,
    required this.state,
  });

  factory Education.fromMap(Map<String, dynamic> map, int state) {
    return Education(
      title: map['title'] ?? '',
      date: map['date'],
      image: map['image'] ?? '',
      videoUrl: map['video'],
      state: state,
    );
  }

  factory Education.fromJson(String source) =>
      Education.fromMap(json.decode(source), 0);
}
