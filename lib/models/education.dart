import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class Education {
  String title;
  Timestamp date;
  String image;
  String videoUrl;
  Education({
    required this.title,
    required this.date,
    required this.image,
    required this.videoUrl,
  });

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      title: map['title'] ?? '',
      date: map['date'],
      image: map['image'] ?? '',
      videoUrl: map['video'],
    );
  }

  factory Education.fromJson(String source) =>
      Education.fromMap(json.decode(source));
}
