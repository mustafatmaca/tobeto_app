import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  final String title;
  final DateTime date;
  final String image;

  const EducationCard({
    required this.title,
    required this.date,
    required this.image,
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      padding: EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text("${date.day}/${date.month}/${date.year}"),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromWidth(
                MediaQuery.of(context).size.width * 0.85,
              )),
              onPressed: () {},
              child: Text('Eğitime Git'),
            ),
          ),
        ],
      ),
    );
  }
}
