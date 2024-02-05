import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tobeto_app/blocs/lesson_bloc/lesson_bloc.dart';
import 'package:tobeto_app/blocs/lesson_bloc/lesson_event.dart';
import 'package:tobeto_app/blocs/lesson_bloc/lesson_state.dart';
import 'package:tobeto_app/models/lesson.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Takvim",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<LessonBloc, LessonState>(
          builder: (context, state) {
            if (state is LessonInitial) {
              context.read<LessonBloc>().add(LoadLessons());
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LessonLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LessonLoaded) {
              return Column(
                children: [
                  TableCalendar(
                    focusedDay: _focusedDay,
                    firstDay: DateTime(1990),
                    lastDay: DateTime(2050),
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) => state.lessons.any((event) =>
                        isSameDay(
                            day,
                            DateTime.fromMillisecondsSinceEpoch(
                                event.date.millisecondsSinceEpoch))),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _focusedDay = focusedDay;
                        _selectedDay = selectedDay;
                      });
                    },
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      markersMaxCount: 1,
                    ),
                    calendarBuilders: CalendarBuilders(
                      selectedBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      todayBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: _buildEvents(state.lessons),
                  ),
                ],
              );
            } else if (state is LessonError) {
              return Center(
                child: Text("Something went wrong!"),
              );
            } else {
              return Center(
                child: Text("Error"),
              );
            }
          },
        ));
  }

  Widget _buildEvents(List<Lesson> lessons) {
    if (_selectedDay == null) {
      lessons.sort((a, b) => a.date.compareTo(b.date));
      return ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final event = lessons[index];
          final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(
              DateTime.fromMillisecondsSinceEpoch(
                  event.date.millisecondsSinceEpoch));

          return ListTile(
            title: Text(
              'Eğitim: ${event.education}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Eğitmen: ${event.instructor}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Tarih: $formattedDate',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      );
    } else {
      final selectedEvents = lessons
          .where((event) => isSameDay(
              _selectedDay,
              DateTime.fromMillisecondsSinceEpoch(
                  event.date.millisecondsSinceEpoch)))
          .toList();

      selectedEvents.sort((a, b) => a.date.compareTo(b.date));

      return ListView.builder(
        itemCount: selectedEvents.length,
        itemBuilder: (context, index) {
          final event = selectedEvents[index];
          final formattedDate = DateFormat('dd/MM/yyyy HH:mm').format(
              DateTime.fromMillisecondsSinceEpoch(
                  event.date.millisecondsSinceEpoch));

          return ListTile(
            title: Text('Eğitim: ${event.education}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Eğitmen: ${event.instructor}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Tarih: $formattedDate',
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
