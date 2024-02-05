// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CarouselState {}

class CarouselInitial extends CarouselState {}

class CarouselLoaded extends CarouselState {
  int currentIndex = 0;

  CarouselLoaded({
    required this.currentIndex,
  });
}

class CarouselError extends CarouselState {}
