import 'package:flutter/material.dart';
import 'package:tobeto_app/screens/calendar_screen.dart';
import 'package:tobeto_app/screens/catalog_screen.dart';
import 'package:tobeto_app/screens/home_screen.dart';
import 'package:tobeto_app/screens/login_screen.dart';
import 'package:tobeto_app/screens/profile_screen.dart';
import 'package:tobeto_app/screens/reviews_screen.dart';

List<Widget> pages = [
  const HomeScreen(),
  const ReviewsScreen(),
  const ProfileScreen(),
  const CatalogScreen(),
  const CalendarScreen()
];

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tobeto"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/tobeto-logo.png",
                      width: 120,
                      height: 60,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  "Anasayfa",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  if (currentPage == 0) {
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      currentPage = 0;
                    });

                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                title: Text(
                  "Değerlendirmeler",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  if (currentPage == 1) {
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      currentPage = 1;
                    });

                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                title: Text(
                  "Profilim",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  if (currentPage == 2) {
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      currentPage = 2;
                    });
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                title: Text(
                  "Katalog",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  if (currentPage == 3) {
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      currentPage = 3;
                    });
                    Navigator.pop(context);
                  }
                },
              ),
              ListTile(
                title: Text(
                  "Takvim",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  if (currentPage == 4) {
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      currentPage = 4;
                    });
                    Navigator.pop(context);
                  }
                },
              ),
              const Divider(),
              const ListTile(
                title: Row(
                  children: [
                    Text("Tobeto"),
                    SizedBox(width: 9),
                    Icon(Icons.home),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black45, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: const Text("Kullanıcı Adı "),
                  trailing: const CircleAvatar(
                    child: Icon(Icons.person_pin),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text("© 2022 Tobeto"),
              ),
              ListTile(
                title: Text(
                  "Çıkış Yap",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                trailing: Icon(Icons.logout_outlined),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
                },
              ),
            ],
          ),
        ),
        body: pages[currentPage]);
  }
}
