import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
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

  UserModel(
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
      result.addAll({'birthdate': birthdate});
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

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      email: map['email'] ?? '',
      gsm: map['gsm'],
      birthdate: map['birthdate'],
      adress: map['adress'],
      about: map['about'],
      skills: map['skills'],
      certificates: map['certificates'],
      languages: map['languages'],
      socials: map['socials'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
