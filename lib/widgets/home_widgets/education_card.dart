import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/video_player_page.dart';

class EducationCard extends StatelessWidget {
  final String id;
  final String title;
  final DateTime date;
  final String? image;
  final String video;
  final int state;

  const EducationCard({
    required this.id,
    required this.title,
    required this.date,
    required this.image,
    required this.context,
    required this.video,
    required this.state,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width * 0.03,
          left: MediaQuery.of(context).size.width * 0.04,
          right: MediaQuery.of(context).size.width * 0.04),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoPlayerPage(
                  videoId: id,
                  videoUrl: video,
                  title: title,
                ),
              ));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.93,
          height: MediaQuery.of(context).size.height * 0.15,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Stack(children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  child: image == null
                      ? Container()
                      : Image.network(
                          image!,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF004D79),
                          Color(0xFF011D42),
                          Color(0xFF341132),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomLeft,
                      ),
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text("${date.day}/${date.month}/${date.year}",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontWeight: FontWeight.bold,
                                )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            state == 0
                ? const Positioned(
                    bottom: 3,
                    right: 3,
                    child: Icon(
                      Icons.play_circle_filled,
                      size: 30,
                      color: Colors.white,
                    ),
                  )
                : const Positioned(
                    bottom: 3,
                    right: 3,
                    child: Icon(
                      Icons.check_circle,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
          ]),
        ),
      ),
    );
  }
}
