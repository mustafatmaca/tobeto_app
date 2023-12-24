import 'package:flutter/material.dart';

class AnnouncementCard extends StatelessWidget {
  final String type;
  final String eduType;
  final String title;
  final DateTime date;
  const AnnouncementCard(
      {Key? key,
      required this.type,
      required this.eduType,
      required this.title,
      required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.88,
      decoration: BoxDecoration(
        border: const Border(
            left: BorderSide(
                width: 7, color: Color(0xFF076B34), style: BorderStyle.solid)),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Color(0xFF076B34)),
              ),
              Text(
                eduType,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Color(0xFF076B34)),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            children: [
              const SizedBox(width: 5),
              Expanded(
                child: Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.date_range_outlined,
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Text("${date.day}/${date.month}/${date.year}"),
              ),
              InkWell(onTap: () {}, child: const Text("Devamını Oku")),
            ],
          ),
        ],
      ),
    );
  }
}
