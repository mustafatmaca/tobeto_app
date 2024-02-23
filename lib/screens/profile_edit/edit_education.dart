import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  final _formKey = GlobalKey<FormState>();
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
        child: Form(
          key: _formKey,
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
                          dropdownColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          isExpanded: true,
                          underline: Container(),
                          value: dropdownValue,
                          items: list
                              .map<DropdownMenuItem<String>>((String value) {
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
                  TextFormField(
                    controller: _schoolController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Okul Adı Boş Bırakılamaz";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _schoolController.text = newValue!,
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
                  TextFormField(
                    controller: _sectionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Bölüm Boş Bırakılamaz";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _sectionController.text = newValue!,
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
                      if (_formKey.currentState!.validate() &&
                          widget.userModel.graduates != null) {
                        _formKey.currentState!.save();
                        context.read<UserInfoBloc>().add(UpdateUserGraduate(
                                userModel: UserModel(
                              name: widget.userModel.name,
                              surname: widget.userModel.surname,
                              email: widget.userModel.email,
                              graduates: [
                                ...widget.userModel.graduates!,
                                isWork
                                    ? Graduate(
                                        type: dropdownValue,
                                        name: _schoolController.text,
                                        section: _sectionController.text,
                                        startDate:
                                            Timestamp.fromDate(startDate!),
                                        isContinue: isWork)
                                    : Graduate(
                                        type: dropdownValue,
                                        name: _schoolController.text,
                                        section: _sectionController.text,
                                        startDate:
                                            Timestamp.fromDate(startDate!),
                                        endDate: Timestamp.fromDate(endDate!),
                                        isContinue: isWork)
                              ],
                            )));
                        Navigator.pop(context);
                        context.read<UserInfoBloc>().add(ResetEvent());
                      } else if (_formKey.currentState!.validate() &&
                          widget.userModel.graduates == null) {
                        _formKey.currentState!.save();
                        context.read<UserInfoBloc>().add(UpdateUserGraduate(
                                userModel: UserModel(
                              name: widget.userModel.name,
                              surname: widget.userModel.surname,
                              email: widget.userModel.email,
                              graduates: [
                                isWork
                                    ? Graduate(
                                        type: dropdownValue,
                                        name: _schoolController.text,
                                        section: _sectionController.text,
                                        startDate:
                                            Timestamp.fromDate(startDate!),
                                        isContinue: isWork)
                                    : Graduate(
                                        type: dropdownValue,
                                        name: _schoolController.text,
                                        section: _sectionController.text,
                                        startDate:
                                            Timestamp.fromDate(startDate!),
                                        endDate: Timestamp.fromDate(endDate!),
                                        isContinue: isWork)
                              ],
                            )));
                        Navigator.pop(context);
                        context.read<UserInfoBloc>().add(ResetEvent());
                      }
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
                  widget.userModel.graduates != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: widget.userModel.graduates!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading:
                                  const Icon(FontAwesomeIcons.graduationCap),
                              title: Text(
                                widget.userModel.graduates![index].name!,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              subtitle: Text(
                                widget.userModel.graduates![index].type!,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.userModel.graduates!.remove(
                                          widget.userModel.graduates![index]);
                                    });
                                    context
                                        .read<UserInfoBloc>()
                                        .add(UpdateUserGraduate(
                                            userModel: UserModel(
                                          name: widget.userModel.name,
                                          surname: widget.userModel.surname,
                                          email: widget.userModel.email,
                                          graduates: widget.userModel.graduates,
                                        )));
                                    context
                                        .read<UserInfoBloc>()
                                        .add(ResetEvent());
                                  },
                                  icon: const Icon(FontAwesomeIcons.trash)),
                            );
                          },
                        )
                      : Container(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
