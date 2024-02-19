import 'dart:convert';

class Application {
  String title;
  String subtitle;
  String subtitle1;
  int state;

  Application({
    required this.title,
    required this.subtitle,
    required this.subtitle1,
    required this.state,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'subtitle1': subtitle1,
    };
  }

  factory Application.fromMap(Map<String, dynamic> map, int state) {
    return Application(
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      subtitle1: map['subtitle1'] as String,
      state: state,
    );
  }

  String toJson() => json.encode(toMap());

  factory Application.fromJson(String source) =>
      Application.fromMap(json.decode(source) as Map<String, dynamic>, 1);
}
