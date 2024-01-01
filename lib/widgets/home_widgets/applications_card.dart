import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ApplicationsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String subtitle2;

  const ApplicationsCard(
      {required this.title,
      required this.subtitle,
      required this.subtitle2,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.88,
      decoration: BoxDecoration(
        border: const Border(
            left: BorderSide(
                width: 7, color: Color(0xFF076B34), style: BorderStyle.solid)),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
      ),
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 5),
              Expanded(
                child: Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: const EdgeInsets.only(
                    bottom: 5, top: 5, right: 40, left: 15),
                decoration: const BoxDecoration(
                    color: Color(0xFF076B34),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                child: Text("Kabul Edildi",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.background)),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check,
                color: Color(0xFF076B34),
              ),
              SizedBox(width: 5),
              Expanded(child: Text(subtitle)),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check,
                color: Color(0xFF076B34),
              ),
              SizedBox(width: 5),
              Expanded(child: Text(subtitle2)),
            ],
          ),
        ],
      ),
    );
  }
}
