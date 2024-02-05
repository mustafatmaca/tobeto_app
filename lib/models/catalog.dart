import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Catalog {
  String title;
  String image;
  String video;
  String instructor;
  int time;

  Catalog({
    required this.title,
    required this.image,
    required this.video,
    required this.instructor,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'image': image,
      'video': video,
      'instructor': instructor,
      'time': time,
    };
  }

  factory Catalog.fromMap(Map<String, dynamic> map) {
    return Catalog(
      title: map['title'] as String,
      image: map['image'] as String,
      video: map['video'] as String,
      instructor: map['instructor'] as String,
      time: map['time'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Catalog.fromJson(String source) =>
      Catalog.fromMap(json.decode(source) as Map<String, dynamic>);
}
