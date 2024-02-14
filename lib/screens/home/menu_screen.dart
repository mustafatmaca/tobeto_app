import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/announcement_bloc/announcement_bloc.dart';
import 'package:tobeto_app/blocs/announcement_bloc/announcement_event.dart';
import 'package:tobeto_app/blocs/application_bloc/application_bloc.dart';
import 'package:tobeto_app/blocs/application_bloc/application_event.dart';
import 'package:tobeto_app/blocs/education_bloc/education_bloc.dart';
import 'package:tobeto_app/blocs/education_bloc/education_event.dart';
import 'package:tobeto_app/screens/home/home_announcement_screen.dart';
import 'package:tobeto_app/screens/home/home_application_screen.dart';
import 'package:tobeto_app/screens/home/home_education_screen.dart';
import 'package:tobeto_app/screens/home/home_survey_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("İstanbul Kodluyor"),
      ),
      body: GridView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
        children: [
          InkWell(
            onTap: () {
              context.read<ApplicationBloc>().add(LoadApplication());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeApplicationScreen(),
                  ));
            },
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF004D79),
                      Color(0xFF011D42),
                      Color(0xFF341132),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/basvurularim.png",
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text("Başvurularım",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.background,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.read<EducationBloc>().add(LoadEducation());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeEducationScreen()));
            },
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF004D79),
                      Color(0xFF011D42),
                      Color(0xFF341132),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/egitimlerim.png",
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text("Eğitimlerim",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.background,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              context.read<AnnouncementBloc>().add(LoadAnno());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeAnnouncement()));
            },
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF004D79),
                      Color(0xFF011D42),
                      Color(0xFF341132),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/duyurularim.png",
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text("Duyurularım",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.background,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeSurveyScreen()));
            },
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF004D79),
                      Color(0xFF011D42),
                      Color(0xFF341132),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/anketlerim.png",
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text("Anketlerim",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.background,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
