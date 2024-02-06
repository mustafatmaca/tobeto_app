import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Report {
  Map<String, dynamic> reports;  
  Report({
    required this.reports,
  });

 

  factory Report.fromMap(Map<String, dynamic> map) {
    return Report(
      reports: map["reports"]
    );
  }


  factory Report.fromJson(String source) => Report.fromMap(json.decode(source) as Map<String, dynamic>);
}
