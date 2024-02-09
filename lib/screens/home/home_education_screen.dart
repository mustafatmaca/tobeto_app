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
      child:
          NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) {
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
      }, body: BlocBuilder<EducationBloc, EducationState>(
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
              return EmptyCard();
            } else {
              return ListView.builder(
                itemCount: state.educationList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EducationCard(
                        title: state.educationList[index].title,
                        date: DateTime.fromMillisecondsSinceEpoch(state
                            .educationList[index].date.millisecondsSinceEpoch),
                        image: state.educationList[index].image,
                        video: state.educationList[index].videoUrl,
                        context: context),
                  );
                },
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
      )),
    ));
  }
}
