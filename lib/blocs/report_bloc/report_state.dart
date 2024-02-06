// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:tobeto_app/models/report.dart';

abstract class ReportState {}

class ReportInitial extends ReportState {}

class ReportLoading extends ReportState {}

class ReportLoaded extends ReportState {
  List<Report> report;
  ReportLoaded({
    required this.report,
  });
}

class ReportError extends ReportState {}

