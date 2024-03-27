import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tobeto_app/blocs/education_bloc/education_bloc.dart';
import 'package:tobeto_app/blocs/education_bloc/education_event.dart';
import 'package:tobeto_app/blocs/education_bloc/education_state.dart';
import 'package:tobeto_app/widgets/home_widgets/education_card.dart';
import 'package:tobeto_app/widgets/home_widgets/empty_card.dart';

class HomeEducationScreen extends StatefulWidget {
  const HomeEducationScreen({Key? key}) : super(key: key);

  @override
  _HomeEducationScreenState createState() => _HomeEducationScreenState();
}

class _HomeEducationScreenState extends State<HomeEducationScreen> {
  final DateFormat formatter = DateFormat('dd/MM/yyyy');
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
                title: const Text("Eğitimlerim"),
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
              ),
            ];
          },
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.045,
                    right: MediaQuery.of(context).size.width * 0.045,
                    top: MediaQuery.of(context).size.height * 0.01,
                    bottom: MediaQuery.of(context).size.height * 0.01),
                child: TextField(
                  onChanged: (value) {
                    context
                        .read<EducationBloc>()
                        .add(LoadEducationByTitle(title: value));
                  },
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: const Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 25.0,
                      ),
                    ),
                    hintText: "Eğitim arayın...",
                    labelStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                  ),
                ),
              ),
              BlocBuilder<EducationBloc, EducationState>(
                builder: (context, state) {
                  if (state is EducationInitial) {
                    context.read<EducationBloc>().add(LoadEducation());
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is EducationLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is EducationLoaded) {
                    if (state.educationList.isEmpty) {
                      return const EmptyCard();
                    } else {
                      var completed = 0;
                      for (var i in state.educationList) {
                        i.state == 1 ? completed++ : null;
                      }
                      return Column(children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width * 0.8,
                            lineHeight:
                                MediaQuery.of(context).size.height * 0.03,
                            percent: completed / state.educationList.length,
                            center: Text(
                              ((completed / state.educationList.length) * 100)
                                      .toInt()
                                      .toString() +
                                  "%",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            trailing:
                                completed / state.educationList.length == 1.0
                                    ? Icon(FontAwesomeIcons.lock)
                                    : Icon(FontAwesomeIcons.lockOpen),
                            barRadius: Radius.circular(15),
                            backgroundColor: Colors.grey,
                            progressColor: Colors.green,
                          ),
                        ),
                        ...state.educationList
                            .map((e) => EducationCard(
                                id: e.id,
                                title: e.title,
                                date: DateTime.fromMillisecondsSinceEpoch(
                                    e.date.millisecondsSinceEpoch),
                                image: e.image,
                                video: e.videoUrl,
                                state: e.state,
                                context: context))
                            .toList(),
                      ]);
                    }
                  } else if (state is EducationError) {
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
            ],
          )),
    ));
  }
}
