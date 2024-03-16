import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/question_bloc/question_bloc.dart';
import 'package:tobeto_app/blocs/question_bloc/question_event.dart';
import 'package:tobeto_app/blocs/question_bloc/question_state.dart';

List answers = ["a", "b", "c", "d"];

class QuestionsScreen extends StatefulWidget {
  final String examName;
  const QuestionsScreen({Key? key, required this.examName}) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  String? _answers = answers.first;
  int questionIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.examName),
      ),
      body: Column(
        children: [
          Expanded(child: BlocBuilder<QuestionBloc, QuestionState>(
            builder: (context, state) {
              if (state is QuestionInitial) {
                context
                    .read<QuestionBloc>()
                    .add(LoadQuestion(examName: widget.examName));
                return const Center(child: CircularProgressIndicator());
              } else if (state is QuestionLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is QuestionLoaded) {
                return state.question.isNotEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.question[questionIndex].question),
                          Column(
                            children:
                                state.question[questionIndex].answers.entries
                                    .map((e) => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Radio<String>(
                                                value: e.key,
                                                groupValue: _answers,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _answers = value;
                                                  });
                                                },
                                              ),
                                              Text(e.key.toString() + ")"),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.03,
                                              ),
                                              Text(e.value)
                                            ],
                                          ),
                                        ))
                                    .toList(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              questionIndex > 0
                                  ? ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          questionIndex--;
                                        });
                                      },
                                      child: Text("Önceki Soru"))
                                  : Container(),
                              questionIndex == state.question.length - 1
                                  ? ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Sınavı Bitir"))
                                  : ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          questionIndex++;
                                        });
                                      },
                                      child: Text("Sonraki Soru"))
                            ],
                          )
                        ],
                      )
                    : Container();
              } else if (state is QuestionError) {
                return const Center(
                  child: Text("Error"),
                );
              } else {
                return const Center(
                  child: Text("Something went wrong!"),
                );
              }
            },
          ))
        ],
      ),
    );
  }
}
