import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Graduate {
  String? type;
  String? name;
  String? section;
  Timestamp? startDate;
  Timestamp? endDate;
  bool? isContinue;
  Graduate({
    this.type,
    this.name,
    this.section,
    this.startDate,
    this.endDate,
    this.isContinue,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (type != null) {
      result.addAll({'type': type});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (section != null) {
      result.addAll({'section': section});
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

    return result;
  }

  factory Graduate.fromMap(Map<String, dynamic> map) {
    return Graduate(
      type: map['type'],
      name: map['name'],
      section: map['section'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      isContinue: map['isContinue'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Graduate.fromJson(String source) =>
      Graduate.fromMap(json.decode(source));
}
