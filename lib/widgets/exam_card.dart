import 'package:flutter/material.dart';

class ExamCard extends StatelessWidget {
  final String examName;
  final String examClass;
  final String examTime;
  const ExamCard(
      {required this.examName,
      required this.examClass,
      required this.examTime,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              )
            ]),
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Wrap(
                      children: [
                        Text(
                          examName,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(examClass),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        Text(
                          examTime,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset("assets/converted.png")),
              ],
            ),
          ],
        ));
  }
}
