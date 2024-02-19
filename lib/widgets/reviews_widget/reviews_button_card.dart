import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/report_bloc/report_bloc.dart';
import 'package:tobeto_app/blocs/report_bloc/report_event.dart';
import 'package:tobeto_app/blocs/report_bloc/report_state.dart';
import 'package:tobeto_app/models/report.dart';

final reports = Report(reports: {"dfsf": 3.5, "dbfdbf": 3.5, "dfvvfsf": 3.5});

class ReviewsButtonCard extends StatelessWidget {
  final String headLine;
  final String explanation;
  final Color color1;
  final Color color2;
  final Color color3;
  const ReviewsButtonCard(
      {required this.headLine,
      required this.explanation,
      required this.color1,
      required this.color2,
      required this.color3,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
                colors: [color1, color2, color3],
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                headLine,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.background,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  explanation,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.w100),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return BlocBuilder<ReportBloc, ReportState>(
                        builder: (context, state) {
                      if (state is ReportInitial) {
                        context.read<ReportBloc>().add(LoadReport());
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is ReportLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is ReportLoaded) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          padding: const EdgeInsets.all(25),
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Column(
                              children: state.report.first.reports.entries
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Container(
                                                padding:
                                                    const EdgeInsets.all(6),
                                                decoration: const BoxDecoration(
                                                    color: Colors.amber,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                                child:
                                                    Text(e.value.toString())),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                            ),
                                            Text(e.key)
                                          ],
                                        ),
                                      ))
                                  .toList()),
                        );
                      } else if (state is ReportError) {
                        return Center(child: Text("Something went wrong !"));
                      } else {
                        return Center(child: Text("Thats an Error !"));
                      }
                    });
                  },
                );
              },
              child: Text("Raporu Görüntüle",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF004D79),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
