import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/carousel_bloc/carousel_event.dart';
import 'package:tobeto_app/blocs/carousel_bloc/carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(CarouselInitial()) {
    on<ChangeCard>((event, emit) {
      emit(CarouselLoaded(currentIndex: event.index));
    });
  }
}
