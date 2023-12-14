import 'package:flutter/material.dart';
import 'package:tobeto_app/screens/calendar_screen.dart';
import 'package:tobeto_app/screens/catalog_screen.dart';
import 'package:tobeto_app/screens/home_screen.dart';

List<Widget> pages = [HomeScreen(), CatalogScreen(), CalendarScreen()];

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
                      icon: Icon(Icons.close),
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
                  "Profilim",
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
                  "Katalog",
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
                  "Takvim",
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
              Divider(),
              const ListTile(
                title: Row(
                  children: [
                    Text("Tobeto"),
                    SizedBox(width: 9),
                    Icon(Icons.home),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black45, width: 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: Text("Kullanıcı Adı "),
                  trailing: CircleAvatar(
                    child: Icon(Icons.person_pin),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(padding: EdgeInsets.all(10),
              child: Text("© 2022 Tobeto"),)
            ],
          ),
        ),
        body: pages[currentPage]);
  }
}
