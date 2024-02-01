import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: Image.asset("assets/empty.png").image)),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Size atanmış",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                  children: <TextSpan>[
                    TextSpan(
                      text: " herhangi bir içerik bulunmamaktadır!",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
