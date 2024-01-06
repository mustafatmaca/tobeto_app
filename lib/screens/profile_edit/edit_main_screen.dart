import 'package:flutter/material.dart';
import 'package:tobeto_app/screens/profile_edit/edit_personal.dart';

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
        return Container(
          child: Center(child: Text("2")),
        );
      case 2:
        return Container(
          child: Center(child: Text("3")),
        );
      case 3:
        return Container(
          child: Center(child: Text("4")),
        );
      case 4:
        return Container(
          child: Center(child: Text("5")),
        );
      case 5:
        return Container(
          child: Center(child: Text("6")),
        );
      case 6:
        return Container(
          child: Center(child: Text("7")),
        );
      case 7:
        return Container(
          child: Center(child: Text("8")),
        );
      default:
        return Container(); // Varsayılan durumda boş bir container döndürüyoruz.
    }
  }
}
