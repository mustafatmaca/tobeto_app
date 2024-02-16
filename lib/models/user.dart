import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tobeto_app/models/experience.dart';
import 'package:tobeto_app/models/graduate.dart';

class UserModel {
  String name;
  String surname;
  String email;
  String? photoUrl;
  String? gsm;
  Timestamp? birthdate;
  String? adress;
  String? about;
  List<dynamic>? skills;
  List<String>? certificates;
  List<String>? languages;
  List<String>? socials;
  List<Graduate>? graduates;
  List<Experience>? experiences;

  UserModel(
      {required this.name,
      required this.surname,
      required this.email,
      this.photoUrl,
      this.gsm,
      this.birthdate,
      this.adress,
      this.about,
      this.skills,
      this.certificates,
      this.languages,
      this.socials,
      this.graduates,
      this.experiences});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'surname': surname});
    result.addAll({'email': email});
    if (photoUrl != null) {
      result.addAll({'photoUrl': photoUrl});
    }
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
    if (graduates != null) {
      result.addAll({
        'graduates': graduates!
            .map((e) => Graduate(
                    type: e.type,
                    name: e.name,
                    section: e.section,
                    startDate: e.startDate,
                    endDate: e.endDate,
                    isContinue: e.isContinue)
                .toMap())
            .toList()
      });
    }
    if (experiences != null) {
      result.addAll({
        'experiences': experiences!
            .map((e) => Experience(
                    about: e.about,
                    name: e.name,
                    position: e.position,
                    sector: e.sector,
                    isContinue: e.isContinue,
                    endDate: e.endDate,
                    startDate: e.startDate)
                .toMap())
            .toList()
      });
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      email: map['email'] ?? '',
      photoUrl: map['photoUrl'],
      gsm: map['gsm'],
      birthdate: map['birthdate'],
      adress: map['adress'],
      about: map['about'],
      skills: map['skills'],
      certificates: map['certificates'],
      languages: map['languages'],
      socials: map['socials'],
      graduates: map['graduates'] != null
          ? List<Graduate>.from(
              (map['graduates'] as List<dynamic>).map<Graduate?>(
                (x) => Graduate.fromMap(x),
              ),
            )
          : [],
      experiences: map['experiences'] != null
          ? List<Experience>.from(
              (map['experiences'] as List<dynamic>).map<Experience?>(
                (x) => Experience.fromMap(x),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
