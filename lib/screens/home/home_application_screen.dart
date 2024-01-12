import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/home_widgets/applications_card.dart';

class HomeApplicationScreen extends StatefulWidget {
  const HomeApplicationScreen({Key? key}) : super(key: key);

  @override
  _HomeApplicationScreenState createState() => _HomeApplicationScreenState();
}

class _HomeApplicationScreenState extends State<HomeApplicationScreen> {
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
            title: Text("Başvurularım"),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
          )
        ];
      },
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return ApplicationsCard(
              title: "title $index",
              subtitle: "subtitle $index",
              subtitle2: "subtitle2 $index");
        },
      ),
    ));
  }
}
