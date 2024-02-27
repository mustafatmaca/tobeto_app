import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/announcement_bloc/announcement_bloc.dart';
import 'package:tobeto_app/blocs/announcement_bloc/announcement_event.dart';
import 'package:tobeto_app/blocs/announcement_bloc/announcement_state.dart';
import 'package:tobeto_app/widgets/home_widgets/announcement_card.dart';
import 'package:tobeto_app/widgets/home_widgets/empty_card.dart';

class HomeAnnouncement extends StatefulWidget {
  const HomeAnnouncement({Key? key}) : super(key: key);

  @override
  _HomeAnnouncementState createState() => _HomeAnnouncementState();
}

class _HomeAnnouncementState extends State<HomeAnnouncement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Text("Duyurularım"),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ];
        },
        body: BlocBuilder<AnnouncementBloc, AnnouncementState>(
          builder: (context, state) {
            if (state is AnnouncementInitial) {
              context.read<AnnouncementBloc>().add(LoadAnno());
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AnnouncementLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AnnouncementLoaded) {
              if (state.announcementList.isEmpty) {
                return const EmptyCard();
              } else {
                return ListView.builder(
                  itemCount: state.announcementList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      child: AnnouncementCard(
                        type: state.announcementList[index].type,
                        eduType: state.announcementList[index].eduType,
                        title: state.announcementList[index].title,
                        content: state.announcementList[index].content,
                        date: DateTime.fromMillisecondsSinceEpoch(state
                            .announcementList[index]
                            .date
                            .millisecondsSinceEpoch),
                        onTapReadMore: () {
                          _showReadMoreModal(
                            context,
                            state.announcementList[index].title,
                            state.announcementList[index].content,
                          );
                        },
                      ),
                    );
                  },
                );
              }
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
      ),
    ));
  }
}

void _showReadMoreModal(BuildContext context, String title, String content) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: ListView(
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text(content, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      );
    },
  );
}
