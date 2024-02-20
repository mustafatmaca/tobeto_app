import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_event.dart';
import 'package:tobeto_app/models/graduate.dart';
import 'package:tobeto_app/models/user.dart';

const List<String> list = <String>[
  'Lise',
  'Lisans',
  'Yüksek Lisans',
  'Doktora'
];

class EditEducation extends StatefulWidget {
  final UserModel userModel;
  EditEducation({Key? key, required this.userModel}) : super(key: key);

  @override
  _EditEducationState createState() => _EditEducationState();
}

class _EditEducationState extends State<EditEducation> {
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  var dropdownValue = list.first;
  var isWork = false;
  DateTime? startDate = DateTime.now();
  DateTime? endDate = DateTime.now();

  void startDatePicker() async {
    var date = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2000, 1, 1),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      changeStartDateText(date);
    }
  }

  void changeStartDateText(date) {
    setState(() {
      startDate = date;
    });
  }

  void endDatePicker() async {
    var date = await showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: DateTime(2000, 1, 1),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      changeEndDateText(date);
    }
  }

  void changeEndDateText(date) {
    setState(() {
      endDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Eğitim Hayatım"),
        scrolledUnderElevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.04,
            right: MediaQuery.of(context).size.width * 0.04),
        child: ListView(
          children: [
            Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Eğitim Durumu",
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black38),
                        borderRadius: BorderRadius.circular(14)),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.02,
                          right: MediaQuery.of(context).size.width * 0.02),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        underline: Container(),
                        value: dropdownValue,
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Okul Adı",
                  ),
                ),
                TextField(
                  controller: _schoolController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Bölüm",
                  ),
                ),
                TextField(
                  controller: _sectionController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Başlangıç Yılı",
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black38),
                      borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02,
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${startDate!.year}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        IconButton(
                            onPressed: () {
                              startDatePicker();
                            },
                            icon: const Icon(Icons.calendar_month)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Mezuniyet Yılı",
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black38),
                      borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02,
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${endDate!.year}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        isWork == false
                            ? IconButton(
                                onPressed: () {
                                  endDatePicker();
                                },
                                icon: const Icon(Icons.calendar_month))
                            : Container(),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Checkbox(
                        value: isWork,
                        onChanged: (value) {
                          setState(() {
                            isWork = value!;
                          });
                        },
                      ),
                      const Text("Devam Ediyorum")
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.userModel.graduates != null
                        ? context.read<UserInfoBloc>().add(UpdateUserGraduate(
                                userModel: UserModel(
                              name: widget.userModel.name,
                              surname: widget.userModel.surname,
                              email: widget.userModel.email,
                              graduates: [
                                ...widget.userModel.graduates!,
                                Graduate(
                                    type: dropdownValue,
                                    name: _schoolController.text,
                                    section: _sectionController.text,
                                    startDate: Timestamp.fromDate(startDate!),
                                    endDate: Timestamp.fromDate(endDate!),
                                    isContinue: isWork)
                              ],
                            )))
                        : context.read<UserInfoBloc>().add(UpdateUserGraduate(
                                userModel: UserModel(
                              name: widget.userModel.name,
                              surname: widget.userModel.surname,
                              email: widget.userModel.email,
                              graduates: [
                                Graduate(
                                    type: dropdownValue,
                                    name: _schoolController.text,
                                    section: _sectionController.text,
                                    startDate: Timestamp.fromDate(startDate!),
                                    endDate: Timestamp.fromDate(endDate!),
                                    isContinue: isWork)
                              ],
                            )));

                    Navigator.pop(context);
                    context.read<UserInfoBloc>().add(ResetEvent());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF011D42),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width * 0.9,
                        MediaQuery.of(context).size.height * 0.06,
                      )),
                  child: const Text("Kaydet"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
