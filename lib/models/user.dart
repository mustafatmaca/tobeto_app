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
}
