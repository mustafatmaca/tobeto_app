import 'package:flutter/material.dart';
import 'package:tobeto_app/screens/calendar_screen.dart';
import 'package:tobeto_app/screens/login_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          onTap: () {},
          leading: Icon(
            Icons.feedback,
            color: Theme.of(context).iconTheme.color,
          ),
          title: Text(
            "Bize Başvurun",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Divider(),
        ListTile(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          },
          leading: Icon(
            Icons.logout,
            color: Theme.of(context).iconTheme.color,
          ),
          title: Text(
            "Çıkış Yap",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
