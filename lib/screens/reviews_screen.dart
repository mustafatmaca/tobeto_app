import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/custom_widgets/footer.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text("Reviews"),
        ),
        Footer(),
      ],
    );
  }
}
