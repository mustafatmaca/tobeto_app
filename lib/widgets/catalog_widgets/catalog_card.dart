import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/video_player_page.dart';

class CatalogCard extends StatelessWidget {
  final String title;
  final String image;
  final String instructor;
  final int time;
  final String video;

  const CatalogCard({
    Key? key,
    required this.title,
    required this.image,
    required this.instructor,
    required this.time,
    required this.video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoPlayerPage(
                videoUrl: video,
                title: title,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: image == ""
                        ? Container()
                        : Image.network(
                            image,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF004D79),
                            Color(0xFF011D42),
                            Color(0xFF341132),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomLeft,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(instructor,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background,
                                          fontWeight: FontWeight.bold)),
                              Icon(
                                Icons.access_time,
                                size: 18,
                                color: Theme.of(context).colorScheme.background,
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.006,
                              ),
                              Text(
                                (time / 60).toInt().toString() +
                                    " Saat" +
                                    " " +
                                    (time % 60).toString() +
                                    " Dakika",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.006,
                          ),
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  fontWeight: FontWeight.bold,
                                ),
                            maxLines: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Positioned(
                bottom: 3,
                right: 3,
                child: Icon(
                  Icons.play_circle_filled,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
