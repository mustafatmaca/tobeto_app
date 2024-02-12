import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Experience {
  String? name;
  String? position;
  String? sector;
  Timestamp? startDate;
  Timestamp? endDate;
  bool? isContinue;
  String? about;
  Experience({
    this.name,
    this.position,
    this.sector,
    this.startDate,
    this.endDate,
    this.isContinue,
    this.about,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (position != null) {
      result.addAll({'position': position});
    }
    if (sector != null) {
      result.addAll({'sector': sector});
    }
    if (startDate != null) {
      result.addAll({'startDate': startDate});
    }
    if (endDate != null) {
      result.addAll({'endDate': endDate});
    }
    if (isContinue != null) {
      result.addAll({'isContinue': isContinue});
    }
    if (about != null) {
      result.addAll({'about': about});
    }

    return result;
  }

  factory Experience.fromMap(Map<String, dynamic> map) {
    return Experience(
      name: map['name'],
      position: map['position'],
      sector: map['sector'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      isContinue: map['isContinue'],
      about: map['about'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Experience.fromJson(String source) =>
      Experience.fromMap(json.decode(source));
}
