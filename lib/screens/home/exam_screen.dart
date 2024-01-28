import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/exam_bloc/exam_bloc.dart';
import 'package:tobeto_app/blocs/exam_bloc/exam_event.dart';
import 'package:tobeto_app/blocs/exam_bloc/exam_state.dart';
import 'package:tobeto_app/widgets/home_widgets/exam_card.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sınavlarım"),
      ),
      body: BlocBuilder<ExamBloc, ExamState>(
        builder: (context, state) {
          if (state is ExamInitial) {
            context.read<ExamBloc>().add(LoadExam());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExamLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExamLoaded) {
            return ListView.builder(
              itemCount: state.examList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExamCard(
                      examName: state.examList[index].name,
                      examClass: state.examList[index].examClass,
                      examTime: state.examList[index].time),
                );
              },
            );
          } else if (state is ExamError) {
            return const Center(
              child: Text("That's an error."),
            );
          } else {
            return const Center(
              child: Text("Something goes wrong."),
            );
          }
        },
      ),
    );
  }
}
