import 'package:flutter/material.dart';

class ExamCard extends StatelessWidget {
  final String examName;
  final String examClass;
  final String examType;
  final String examContent;
  final int examQuestionNumber;
  final int examTime;
  const ExamCard(
      {required this.examName,
      required this.examClass,
      required this.examTime,
      required this.examType,
      required this.examContent,
      required this.examQuestionNumber,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.6,
              padding: EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Text(
                    examName,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(examContent),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text("Sınav Süresi: $examTime"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text("Soru Sayısı: $examQuestionNumber"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text("Soru Tipi: $examType"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Raporu Görüntüle"),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF004D79),
                    Color(0xFF011D42),
                    Color(0xFF341132)
                  ]),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          Text(
                            examName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(examClass,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Text(
                            "${examTime} Dakika",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
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
          )),
    );
  }
}
