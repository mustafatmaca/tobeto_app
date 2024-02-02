import 'package:cloud_firestore/cloud_firestore.dart';

class CalendarEvent {
  final String id;
  final String? education;
  final String? instructor;
  final DateTime? date;
  CalendarEvent({
    required this.id,
    required this.education,
    required this.instructor,
    required this.date,
  });

  factory CalendarEvent.fromFireStore(QueryDocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CalendarEvent(
        id: doc.id,
        education: data['education'] ?? "",
        instructor: data['instructor'] ?? "",
        date: (data['date'] as Timestamp).toDate());
  }
}
