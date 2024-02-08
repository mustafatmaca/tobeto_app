import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/home_widgets/empty_card.dart';

class HomeSurveyScreen extends StatefulWidget {
  const HomeSurveyScreen({Key? key}) : super(key: key);

  @override
  _HomeSurveyScreenState createState() => _HomeSurveyScreenState();
}

class _HomeSurveyScreenState extends State<HomeSurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              snap: true,
              floating: true,
              scrolledUnderElevation: 0.0,
              title: Text("Anketlerim"),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios)),
            )
          ];
        },
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return EmptyCard();
          },
        ),
      ),
    ));
  }
}
