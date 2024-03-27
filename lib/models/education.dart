import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Education {
  String id;
  String title;
  Timestamp date;
  String image;
  String videoUrl;
  int state;
  Education({
    required this.id,
    required this.title,
    required this.date,
    required this.image,
    required this.videoUrl,
    required this.state,
  });

  factory Education.fromMap(String id, Map<String, dynamic> map, int state) {
    return Education(
      id: id,
      title: map['title'] ?? '',
      date: map['date'],
      image: map['image'] ?? '',
      videoUrl: map['video'],
      state: state,
    );
  }

  factory Education.fromJson(String source) =>
      Education.fromMap("", json.decode(source), 0);
}
