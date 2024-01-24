// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class NavigationEvent {}

class ChangeScreen extends NavigationEvent {
  int index;

  ChangeScreen({
    required this.index,
  });
}
