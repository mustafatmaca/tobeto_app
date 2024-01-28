import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/screens/profile_edit/edit_certificate.dart';
import 'package:tobeto_app/screens/profile_edit/edit_education.dart';
import 'package:tobeto_app/screens/profile_edit/edit_experience.dart';
import 'package:tobeto_app/screens/profile_edit/edit_language.dart';
import 'package:tobeto_app/screens/profile_edit/edit_personal.dart';
import 'package:tobeto_app/screens/profile_edit/edit_settings.dart';
import 'package:tobeto_app/screens/profile_edit/edit_skills.dart';
import 'package:tobeto_app/screens/profile_edit/edit_social.dart';

List<Widget> tabList = [
  const Tab(
    icon: Icon(
      FontAwesomeIcons.solidUser,
      size: 16,
    ),
    text: "Kişisel",
  ),
  const Tab(
    icon: Icon(
      FontAwesomeIcons.briefcase,
      size: 16,
    ),
    text: "Deneyim",
  ),
  const Tab(
    icon: Icon(
      FontAwesomeIcons.graduationCap,
      size: 16,
    ),
    text: "Eğitim",
  ),
  const Tab(
    icon: Icon(
      FontAwesomeIcons.solidStar,
      size: 16,
    ),
    text: "Yetenek",
  ),
  const Tab(
    icon: Icon(
      FontAwesomeIcons.certificate,
      size: 16,
    ),
    text: "Sertifika",
  ),
  const Tab(
    icon: Icon(
      FontAwesomeIcons.hashtag,
      size: 16,
    ),
    text: "Sosyal",
  ),
  const Tab(
    icon: Icon(
      FontAwesomeIcons.globe,
      size: 16,
    ),
    text: "Dil",
  ),
  const Tab(
    icon: Icon(
      FontAwesomeIcons.gear,
      size: 16,
    ),
    text: "Ayarlar",
  ),
];

class EditMainScreen extends StatefulWidget {
  const EditMainScreen({Key? key}) : super(key: key);

  @override
  _EditMainScreenState createState() => _EditMainScreenState();
}

class _EditMainScreenState extends State<EditMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text("Düzenle"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close))
        ],
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Divider(
              color: Colors.black26,
              height: 1.0,
            )),
      ),
      body: DefaultTabController(
        length: tabList.length,
        child: Column(
          children: [
            ButtonsTabBar(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: <Color>[
                    Color(0xFF004D79),
                    Color(0xFF011D42),
                    Color(0xFF341132)
                  ],
                ),
              ),
              unselectedBackgroundColor:
                  Theme.of(context).scaffoldBackgroundColor,
              unselectedLabelStyle: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(inherit: true),
              radius: 100,
              tabs: tabList,
            ),
            Divider(
              height: 1.0,
              color: Theme.of(context).iconTheme.color!.withOpacity(0.3),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            buildContent(),
          ],
        ),
      ),
    );
  }

  Widget buildContent() {
    return const Expanded(
      child: TabBarView(viewportFraction: 1.0, children: [
        EditPersonal(),
        EditExperience(),
        EditEducation(),
        EditSkills(),
        EditCertificate(),
        EditSocial(),
        EditLanguage(),
        EditSettings(),
      ]),
    );
  }
}
