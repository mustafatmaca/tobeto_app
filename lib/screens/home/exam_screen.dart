import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/exam_bloc/exam_bloc.dart';
import 'package:tobeto_app/blocs/exam_bloc/exam_event.dart';
import 'package:tobeto_app/blocs/exam_bloc/exam_state.dart';
import 'package:tobeto_app/widgets/home_widgets/empty_card.dart';
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
            if (state.examList.isEmpty) {
              return EmptyCard();
            } else {
              return ListView.builder(
                itemCount: state.examList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                    child: ExamCard(
                      examName: state.examList[index].name,
                      examClass: state.examList[index].examClass,
                      examType: state.examList[index].examType,
                      examContent: state.examList[index].content,
                      examQuestionNumber: state.examList[index].questionNumber,
                      examTime: state.examList[index].time,
                    ),
                  );
                },
              );
            }
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
