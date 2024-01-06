import 'package:flutter/material.dart';
import 'package:tobeto_app/screens/profile_edit/edit_certificate.dart';
import 'package:tobeto_app/screens/profile_edit/edit_education.dart';
import 'package:tobeto_app/screens/profile_edit/edit_experience.dart';
import 'package:tobeto_app/screens/profile_edit/edit_language.dart';
import 'package:tobeto_app/screens/profile_edit/edit_personal.dart';
import 'package:tobeto_app/screens/profile_edit/edit_settings.dart';
import 'package:tobeto_app/screens/profile_edit/edit_skills.dart';
import 'package:tobeto_app/screens/profile_edit/edit_social.dart';

class EditMainScreen extends StatefulWidget {
  const EditMainScreen({Key? key}) : super(key: key);

  @override
  _EditMainScreenState createState() => _EditMainScreenState();
}

class _EditMainScreenState extends State<EditMainScreen> {
  final ScrollController _scrollController = ScrollController();
  int currentTab = 0;

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
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Divider(
              color: Colors.black26,
              height: 1.0,
            )),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Scrollbar(
                    thumbVisibility: true,
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Row(
                          children: [
                            currentTab == 0
                                ? Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1.8,
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                    ),
                                    child: IconButton(
                                        iconSize: 25,
                                        onPressed: () {
                                          setState(() {
                                            currentTab = 0;
                                          });
                                        },
                                        icon: Icon(Icons.person)),
                                  )
                                : IconButton(
                                    iconSize: 25,
                                    onPressed: () {
                                      setState(() {
                                        currentTab = 0;
                                      });
                                    },
                                    icon: Icon(Icons.person)),
                            currentTab == 1
                                ? Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1.8,
                                                color: Theme.of(context)
                                                    .primaryColor))),
                                    child: IconButton(
                                        iconSize: 25,
                                        onPressed: () {
                                          setState(() {
                                            currentTab = 1;
                                          });
                                        },
                                        icon: Icon(Icons.work)),
                                  )
                                : IconButton(
                                    iconSize: 25,
                                    onPressed: () {
                                      setState(() {
                                        currentTab = 1;
                                      });
                                    },
                                    icon: Icon(Icons.work)),
                            currentTab == 2
                                ? Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1.8,
                                                color: Theme.of(context)
                                                    .primaryColor))),
                                    child: IconButton(
                                        iconSize: 25,
                                        onPressed: () {
                                          setState(() {
                                            currentTab = 2;
                                          });
                                        },
                                        icon: Icon(Icons.book)),
                                  )
                                : IconButton(
                                    iconSize: 25,
                                    onPressed: () {
                                      setState(() {
                                        currentTab = 2;
                                      });
                                    },
                                    icon: Icon(Icons.book)),
                            currentTab == 3
                                ? Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1.8,
                                                color: Theme.of(context)
                                                    .primaryColor))),
                                    child: IconButton(
                                        iconSize: 25,
                                        onPressed: () {
                                          setState(() {
                                            currentTab = 3;
                                          });
                                        },
                                        icon: Icon(Icons.ac_unit)),
                                  )
                                : IconButton(
                                    iconSize: 25,
                                    onPressed: () {
                                      setState(() {
                                        currentTab = 3;
                                      });
                                    },
                                    icon: Icon(Icons.ac_unit)),
                            currentTab == 4
                                ? Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1.8,
                                                color: Theme.of(context)
                                                    .primaryColor))),
                                    child: IconButton(
                                        iconSize: 25,
                                        onPressed: () {
                                          setState(() {
                                            currentTab = 4;
                                          });
                                        },
                                        icon: Icon(Icons.calendar_view_day)),
                                  )
                                : IconButton(
                                    iconSize: 25,
                                    onPressed: () {
                                      setState(() {
                                        currentTab = 4;
                                      });
                                    },
                                    icon: Icon(Icons.calendar_view_day)),
                            currentTab == 5
                                ? Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1.8,
                                                color: Theme.of(context)
                                                    .primaryColor))),
                                    child: IconButton(
                                        iconSize: 25,
                                        onPressed: () {
                                          setState(() {
                                            currentTab = 5;
                                          });
                                        },
                                        icon: Icon(Icons.language)),
                                  )
                                : IconButton(
                                    iconSize: 25,
                                    onPressed: () {
                                      setState(() {
                                        currentTab = 5;
                                      });
                                    },
                                    icon: Icon(Icons.language)),
                            currentTab == 6
                                ? Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1.8,
                                                color: Theme.of(context)
                                                    .primaryColor))),
                                    child: IconButton(
                                        iconSize: 25,
                                        onPressed: () {
                                          setState(() {
                                            currentTab = 6;
                                          });
                                        },
                                        icon: Icon(Icons.translate)),
                                  )
                                : IconButton(
                                    iconSize: 25,
                                    onPressed: () {
                                      setState(() {
                                        currentTab = 6;
                                      });
                                    },
                                    icon: Icon(Icons.translate)),
                            currentTab == 7
                                ? Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1.8,
                                                color: Theme.of(context)
                                                    .primaryColor))),
                                    child: IconButton(
                                        iconSize: 25,
                                        onPressed: () {
                                          setState(() {
                                            currentTab = 7;
                                          });
                                        },
                                        icon: Icon(Icons.settings)),
                                  )
                                : IconButton(
                                    iconSize: 25,
                                    onPressed: () {
                                      setState(() {
                                        currentTab = 7;
                                      });
                                    },
                                    icon: Icon(Icons.settings)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  buildContent(currentTab),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContent(int currentTab) {
    switch (currentTab) {
      case 0:
        return EditPersonal();
      case 1:
        return EditExperience();
      case 2:
        return EditEducation();
      case 3:
        return EditSkills();
      case 4:
        return EditCertificate();
      case 5:
        return EditSocial();
      case 6:
        return EditLanguage();
      case 7:
        return EditSettings();
      default:
        return Container(
          child: Text("Oops! Bir hata oldu."),
        ); // Varsayılan durumda boş bir container döndürüyoruz.
    }
  }
}
