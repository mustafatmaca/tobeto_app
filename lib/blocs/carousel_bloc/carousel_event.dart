// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CarouselEvent {}

class ChangeCard extends CarouselEvent {
  int index;

  ChangeCard({
    required this.index,
  });
}
