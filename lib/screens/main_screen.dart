import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/screens/calendar_screen.dart';
import 'package:tobeto_app/screens/catalog_screen.dart';
import 'package:tobeto_app/screens/home_screen.dart';
import 'package:tobeto_app/screens/more_screen.dart';
import 'package:tobeto_app/screens/profile_screen.dart';
import 'package:tobeto_app/screens/reviews_screen.dart';

List<Widget> pages = [
  const HomeScreen(),
  const ReviewsScreen(),
  const CatalogScreen(),
  const CalendarScreen(),
  const MoreScreen(),
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
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    String imagePath =
        isDarkMode ? "assets/dark.png" : "assets/tobeto-logo.png";
    return Scaffold(
        floatingActionButton: SpeedDial(
          renderOverlay: false,
          elevation: 15,
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).colorScheme.background,
          icon: Icons.messenger,
          activeIcon: Icons.close,
          direction: SpeedDialDirection.up,
          children: [
            SpeedDialChild(
                child: FaIcon(FontAwesomeIcons.whatsapp),
                backgroundColor: Colors.green),
            SpeedDialChild(
                child: FaIcon(FontAwesomeIcons.envelope),
                backgroundColor: const Color.fromARGB(255, 240, 103, 93))
          ],
        ),
        // FloatingActionButton(
        //   elevation: 15,
        //   backgroundColor: Theme.of(context).primaryColor,
        //   foregroundColor: Theme.of(context).colorScheme.background,
        //   onPressed: () {},
        //   child: const Icon(Icons.messenger),
        // ),

        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Anasayfa'),
            BottomNavigationBarItem(
                icon: Icon(Icons.draw), label: 'Değerlendirmeler'),
            BottomNavigationBarItem(
                icon: Icon(Icons.widgets), label: 'Katalog'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: 'Takvim'),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: 'Daha Fazla'),
          ],
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
        ),
        body: pages[currentPage]);
  }
}
