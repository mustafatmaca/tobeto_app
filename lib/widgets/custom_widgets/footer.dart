import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Image.asset(
                    "assets/beyazlogo.png",
                    width: 120,
                    height: 60,
                  ),
                  onTap: () {},
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Bize Ulaşın",
                    style: GoogleFonts.poppins(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.background,
                  ),
                ),
              ],
            ),
            Text(
              "© 2022 Tobeto",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.bold,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
