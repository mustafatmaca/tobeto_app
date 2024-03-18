// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ResultEvent {}

class LoadResult extends ResultEvent {
  String userId;

  LoadResult({
    required this.userId,
  });
}

class ResetEvent extends ResultEvent {}
