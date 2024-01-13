import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  final String headLine;
  final String icon;
  final Color color1;
  final Color color2;
  final Color color3;
  const GradientCard(
      {required this.headLine,
      required this.icon,
      required this.color1,
      required this.color2,
      required this.color3,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
              colors: [color1, color2, color3],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            headLine,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.background,
                fontWeight: FontWeight.bold),
          ),
          Image.asset(
            icon,
            height: MediaQuery.of(context).size.height * 0.18,
          ),
        ],
      ),
    );
  }
}
