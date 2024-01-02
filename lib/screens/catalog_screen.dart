import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/custom_widgets/footer.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  Image img = Image.asset("assets/edu-banner2.png");
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill, image: img.image)),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.3)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              "Öğrenmeye Başla !",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 44.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            
                            TextField(
                                decoration: InputDecoration(
                                    fillColor: Colors.grey,
                                    filled: true,
                                    suffixIcon: const Icon(Icons.search),
                                    label: const Text("Parola"),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    contentPadding: const EdgeInsets.all(8))),
                          ],
                        ),
                      ),
                    )),
                Row(
                  children: [],
                ),
                Footer(),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
