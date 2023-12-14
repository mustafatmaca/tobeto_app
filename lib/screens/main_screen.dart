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
          title: Text("Tobeto"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Text("Tobeto")),
              ListTile(
                title: Text("Anasayfa"),
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
                title: Text("Katalog"),
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
                title: Text("Takvim"),
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
            ],
          ),
        ),
        body: pages[currentPage]);
  }
}
