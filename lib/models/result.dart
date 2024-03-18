import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Result {
  String userId;
  String examName;
  int correct;
  int wrong;

  Result({
    required this.userId,
    required this.examName,
    required this.correct,
    required this.wrong,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'examName': examName,
      'correct': correct,
      'wrong': wrong,
    };
  }

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      userId: map['userId'] as String,
      examName: map['examName'] as String,
      correct: map['correct'] as int,
      wrong: map['wrong'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Result.fromJson(String source) =>
      Result.fromMap(json.decode(source) as Map<String, dynamic>);
}
