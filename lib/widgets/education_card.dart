import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: Image.asset(
                'assets/ecmelayral.jpeg',
                fit: BoxFit.fitWidth,
              ),
            ),
            aspectRatio: 3 / 2,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          const Text("Dr. Ecmel Ayral'dan Hoşgeldin Mesajı",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(DateTime.parse("2023-09-21 15:20").toString()),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Eğitime Git'),
          ),
        ],
      ),
    );
  }
}
