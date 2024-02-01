import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_bloc.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_event.dart';
import 'package:tobeto_app/screens/contactUsPage_screen.dart';
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
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactUsPageScreen()));
          },
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
            context.read<UserControllerBloc>().add(LogoutEvent());
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
