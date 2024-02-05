import 'package:flutter/material.dart';

class CatalogCard extends StatelessWidget {
  final String title;
  final String image;
  final String instructor;
  final int time;

  const CatalogCard({
    Key? key,
    required this.title,
    required this.image,
    required this.instructor,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
      child: InkWell(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              image == ""
                  ? Container()
                  : Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF004D79),
                      Color(0xFF011D42),
                      Color(0xFF341132),
                    ], begin: Alignment.topCenter, end: Alignment.bottomLeft),
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(19), left: Radius.circular(19))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          instructor,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Icon(
                          Icons.access_time,
                          size: 18,
                          color: Theme.of(context).colorScheme.background,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          (time / 60).toInt().toString() +
                              " Saat"
                                  " " +
                              (time % 60).toString() +
                              " Dakika",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 12,
                top: 10,
                child: CircleAvatar(
                  backgroundColor: Color(0xFF011D42),
                  child: Icon(
                    Icons.play_arrow,
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
