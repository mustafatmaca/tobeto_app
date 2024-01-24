import 'package:tobeto_app/models/announcement.dart';

abstract class AnnouncementState {}

final class AnnouncementInitial extends AnnouncementState {}


final class AnnouncementLoading extends AnnouncementState {}

final class AnnouncementLoaded extends AnnouncementState {
  final List<Announcement> announcementList;

  AnnouncementLoaded({required this.announcementList});
}

final class AnnouncementError extends AnnouncementState {}

