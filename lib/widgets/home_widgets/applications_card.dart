import 'package:flutter/material.dart';

class ApplicationsCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String subtitle2;
  final int state;

  const ApplicationsCard(
      {required this.title,
      required this.subtitle,
      required this.subtitle2,
      required this.state,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.88,
      decoration: BoxDecoration(
        border: Border(
            left: BorderSide(
                width: 7,
                color: state == 0
                    ? Color(0xFF076B34)
                    : state == 1
                        ? Color.fromARGB(255, 245, 201, 4)
                        : Colors.red,
                style: BorderStyle.solid)),
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
              SizedBox(width: MediaQuery.of(context).size.width * 0.015),
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
                decoration: BoxDecoration(
                    color: state == 0
                        ? Color(0xFF076B34)
                        : state == 1
                            ? Color.fromARGB(255, 245, 201, 4)
                            : Colors.red,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15))),
                child: Text(
                    state == 0
                        ? "Kabul Edildi"
                        : state == 1
                            ? "Beklemede"
                            : "Reddedildi",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.background)),
              )
            ],
          ),
          Row(
            children: [
              state == 0
                  ? Icon(
                      Icons.check,
                      color: Color(0xFF076B34),
                    )
                  : state == 1
                      ? Icon(
                          Icons.timer_outlined,
                          color: Color.fromARGB(255, 245, 201, 4),
                        )
                      : Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.015),
              Expanded(
                child: state == 0
                    ? Text(subtitle + " Kabul Edildi")
                    : state == 1
                        ? Text(subtitle + " Beklemede")
                        : Text(subtitle + " Reddedildi"),
              ),
            ],
          ),
          Row(
            children: [
              state == 0
                  ? Icon(
                      Icons.check,
                      color: Color(0xFF076B34),
                    )
                  : state == 1
                      ? Icon(
                          Icons.timer_outlined,
                          color: Color.fromARGB(255, 245, 201, 4),
                        )
                      : Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.015),
              Expanded(
                child: state == 0
                    ? Text(subtitle2 + " Kabul Edildi")
                    : state == 1
                        ? Text(subtitle2 + " Beklemede")
                        : Text(subtitle2 + " Reddedildi"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
