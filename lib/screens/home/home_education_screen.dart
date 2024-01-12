import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/home_widgets/education_card.dart';

class HomeEducationScreen extends StatefulWidget {
  const HomeEducationScreen({Key? key}) : super(key: key);

  @override
  _HomeEducationScreenState createState() => _HomeEducationScreenState();
}

class _HomeEducationScreenState extends State<HomeEducationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            snap: true,
            floating: true,
            scrolledUnderElevation: 0.0,
            title: Text("Eğitimlerim"),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
          )
        ];
      },
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return EducationCard(
              title: "title $index",
              date: DateTime.now(),
              image: null,
              context: context);
        },
      ),
    ));
  }
}
