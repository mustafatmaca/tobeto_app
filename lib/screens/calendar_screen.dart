import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/custom_widgets/footer.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text("Calender"),
        ),
        Footer(),
      ],
    );
  }
}
