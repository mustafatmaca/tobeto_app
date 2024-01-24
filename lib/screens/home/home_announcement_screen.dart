import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/announcement_bloc/announcement_bloc.dart';
import 'package:tobeto_app/blocs/announcement_bloc/announcement_event.dart';
import 'package:tobeto_app/blocs/announcement_bloc/announcement_state.dart';
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
      body: BlocBuilder<AnnouncementBloc, AnnouncementState>(
        builder: (context, state) {
          if (state is AnnouncementInitial) {
            context.read<AnnouncementBloc>().add(LoadAnno());
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AnnouncementLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AnnouncementLoaded) {
            return ListView.builder(
                itemCount: state.announcementList.length,
                itemBuilder: (context, index) {
                  return AnnouncementCard(
                      type: state.announcementList[index].type,
                      eduType: state.announcementList[index].eduType,
                      title: state.announcementList[index].title,
                      date: DateTime.fromMillisecondsSinceEpoch(state
                          .announcementList[index]
                          .date
                          .millisecondsSinceEpoch));
                });
          } else if (state is AnnouncementError) {
            return const Center(
              child: Text("That's an error"),
            );
          } else {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
    ));
  }
}
