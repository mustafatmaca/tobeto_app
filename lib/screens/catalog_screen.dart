import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/custom_widgets/footer.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text("Catalog"),
        ),
        Footer(),
      ],
    );
  }
}
