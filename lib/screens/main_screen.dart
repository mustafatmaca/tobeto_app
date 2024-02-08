import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:tobeto_app/blocs/catalog_bloc/catalog_event.dart';
import 'package:tobeto_app/blocs/lesson_bloc/lesson_bloc.dart';
import 'package:tobeto_app/blocs/lesson_bloc/lesson_event.dart';
import 'package:tobeto_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:tobeto_app/blocs/navigation_bloc/navigation_event.dart';
import 'package:tobeto_app/blocs/navigation_bloc/navigation_state.dart';
import 'package:tobeto_app/blocs/service_bloc/service_bloc.dart';
import 'package:tobeto_app/blocs/service_bloc/service_event.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        if (state is NavigationInitial) {
          context.read<NavigationBloc>().add(ChangeScreen(index: 0));
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is NavigationLoaded) {
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
                    onTap: () {
                      context.read<ServiceBloc>().add(SendMessage());
                    },
                    child: FaIcon(FontAwesomeIcons.whatsapp),
                    backgroundColor: Colors.green),
                SpeedDialChild(
                    onTap: () {
                      context.read<ServiceBloc>().add(SendMail());
                    },
                    child: FaIcon(FontAwesomeIcons.envelope),
                    backgroundColor: const Color.fromARGB(255, 240, 103, 93))
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Anasayfa'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.draw), label: 'Değerlendirmeler'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.widgets), label: 'Katalog'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_month), label: 'Takvim'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.more_horiz), label: 'Daha Fazla'),
              ],
              currentIndex: state.currentPage,
              onTap: (value) {
                if (value == 2) {
                  context.read<CatalogBloc>().add(LoadCatalog());
                }
                if (value == 3) {
                  context.read<LessonBloc>().add(LoadLessons());
                }
                context.read<NavigationBloc>().add(ChangeScreen(index: value));
              },
            ),
            body: SafeArea(child: state.pages[state.currentPage]),
          );
        } else {
          return Scaffold(
            body: Center(
              child: Text("Something went wrong!"),
            ),
          );
        }
      },
    );
  }
}
