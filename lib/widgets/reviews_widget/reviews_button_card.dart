import 'package:flutter/material.dart';

class ReviewsButtonCard extends StatelessWidget {
  final String headLine;
  final String explanation;
  final Color color1;
  final Color color2;
  final Color color3;
  const ReviewsButtonCard(
      {required this.headLine,
      required this.explanation,
      required this.color1,
      required this.color2,
      required this.color3,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20, left: 20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
                colors: [color1, color2, color3],
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                headLine,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                explanation,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.w100),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Raporu Görüntüle",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF004D79),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
