import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String surname;
  String email;
  String? gsm;
  Timestamp? birthdate;
  String? adress;
  String? about;
  List<String>? skills;
  List<String>? certificates;
  List<String>? languages;
  List<String>? socials;

  User(
      {required this.name,
      required this.surname,
      required this.email,
      this.gsm,
      this.birthdate,
      this.adress,
      this.about,
      this.skills,
      this.certificates,
      this.languages,
      this.socials});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'surname': surname});
    result.addAll({'email': email});
    if (gsm != null) {
      result.addAll({'gsm': gsm});
    }
    if (birthdate != null) {
      result.addAll({'birthdate': birthdate!.toMap()});
    }
    if (adress != null) {
      result.addAll({'adress': adress});
    }
    if (about != null) {
      result.addAll({'about': about});
    }
    if (skills != null) {
      result.addAll({'skills': skills});
    }
    if (certificates != null) {
      result.addAll({'certificates': certificates});
    }
    if (languages != null) {
      result.addAll({'languages': languages});
    }
    if (socials != null) {
      result.addAll({'socials': socials});
    }

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['name'] ?? '',
      map['surname'] ?? '',
      map['email'] ?? '',
      map['gsm'],
      map['birthdate'] != null ? Timestamp.fromMap(map['birthdate']) : null,
      map['adress'],
      map['about'],
      List<String>.from(map['skills']),
      List<String>.from(map['certificates']),
      List<String>.from(map['languages']),
      List<String>.from(map['socials']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
