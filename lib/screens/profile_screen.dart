import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/footer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text("Profile"),
        ),
        Footer(),
      ],
    );
  }
}
