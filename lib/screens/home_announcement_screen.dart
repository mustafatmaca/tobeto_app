import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/home_widgets/announcement_card.dart';

class HomeAnnouncement extends StatefulWidget {
  const HomeAnnouncement({Key? key}) : super(key: key);

  @override
  _HomeAnnouncementState createState() => _HomeAnnouncementState();
}

class _HomeAnnouncementState extends State<HomeAnnouncement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            title: Text("Duyurularım"),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
        ];
      },
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return AnnouncementCard(
              type: "type $index",
              eduType: "eduType $index",
              title: "title $index",
              date: DateTime.now(),
            );
          }),
    ));
  }
}
