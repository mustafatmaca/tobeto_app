// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Announcement {
  String title;
  String type;
  String eduType;
  Timestamp date;
  Announcement({
    required this.title,
    required this.type,
    required this.eduType,
    required this.date,
  });

  

  factory Announcement.fromMap(Map<String, dynamic> map) {
    return Announcement(
      title: map['title'] as String,
      type: map['type'] as String,
      eduType: map['eduType'] as String,
      date: map['date'],
    );
  }

 

  factory Announcement.fromJson(String source) => Announcement.fromMap(json.decode(source) as Map<String, dynamic>);
}
