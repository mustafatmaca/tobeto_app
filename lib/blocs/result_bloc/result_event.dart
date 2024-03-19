// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tobeto_app/models/result.dart';

abstract class ResultEvent {}

class LoadResult extends ResultEvent {
  String userId;

  LoadResult({
    required this.userId,
  });
}

class AddResult extends ResultEvent {
  Result result;

  AddResult({
    required this.result,
  });
}

class ResetEvent extends ResultEvent {}
