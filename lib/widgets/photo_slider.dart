import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/carousel_bloc/carousel_bloc.dart';
import 'package:tobeto_app/blocs/carousel_bloc/carousel_event.dart';
import 'package:tobeto_app/blocs/carousel_bloc/carousel_state.dart';

class FullWidthPhotoSlider extends StatefulWidget {
  final List<Widget> imageAssets;

  const FullWidthPhotoSlider({Key? key, required this.imageAssets})
      : super(key: key);

  @override
  _FullWidthPhotoSliderState createState() => _FullWidthPhotoSliderState();
}

class _FullWidthPhotoSliderState extends State<FullWidthPhotoSlider> {
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          items: widget.imageAssets,
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(milliseconds: 500),
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              context.read<CarouselBloc>().add(ChangeCard(index: index));
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imageAssets.map((url) {
            int index = widget.imageAssets.indexOf(url);
            return BlocBuilder<CarouselBloc, CarouselState>(
              builder: (context, state) {
                if (state is CarouselLoaded) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: state.currentIndex == index
                          ? const Color.fromARGB(255, 3, 29, 42)
                          : Colors.grey,
                    ),
                  );
                } else {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 3, 29, 42)),
                  );
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
