import 'package:flutter/material.dart';

class CatalogCard extends StatelessWidget {
  final String title;
  final String image;
  final String instructor;
  final int time;

  CatalogCard({
    super.key,
    required this.title,
    required this.image,
    required this.instructor,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 106, 92, 92),
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
                        color: Colors.white,
                        fontSize: 13.0,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Icon(
                      Icons.access_time,
                      size: 18,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      (time / 60).toInt().toString() +
                          " Saat"
                              " " +
                          (time % 60).toString() +
                          " Dakika",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
          const Positioned(
            right: 12,
            top: 10,
            child: CircleAvatar(
              backgroundColor: Colors.deepPurple,
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
