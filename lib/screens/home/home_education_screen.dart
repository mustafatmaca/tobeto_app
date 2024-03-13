import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.educationList.length,
                          itemBuilder: (context, index) {
                            return EducationCard(
                                title: state.educationList[index].title,
                                date: DateTime.fromMillisecondsSinceEpoch(state
                                    .educationList[index]
                                    .date
                                    .millisecondsSinceEpoch),
                                image: state.educationList[index].image,
                                video: state.educationList[index].videoUrl,
                                context: context);
                          },
                        ),
                      );
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
