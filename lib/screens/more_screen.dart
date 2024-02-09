import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_bloc.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_event.dart';
import 'package:tobeto_app/screens/contactUsPage_screen.dart';
import 'package:tobeto_app/screens/login_screen.dart';
import 'package:tobeto_app/screens/profile_edit/edit_settings.dart';
import 'package:tobeto_app/screens/profile_screen.dart';

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
        Container(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/edu-banner2.png"))),
                height: MediaQuery.of(context).size.height * 1,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                height: MediaQuery.of(context).size.height * 0.80,
                child: Column(
                  children: [
                    Text(
                      "Kullanıcı Adı",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      "emailadresi@gmail.com",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.black45),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                      },
                      leading: Icon(
                        Icons.person,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      title: Text(
                        "Profil Bilgilerim",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Divider(),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactUsPageScreen()));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditSettings(),
                            ));
                      },
                      leading: Icon(
                        Icons.settings,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      title: Text(
                        "Settings",
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
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.10,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.height * 0.1,
                  backgroundImage: AssetImage("assets/mine.png"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
