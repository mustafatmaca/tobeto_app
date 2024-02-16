import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_event.dart';
import 'package:tobeto_app/models/experience.dart';
import 'package:tobeto_app/models/user.dart';

class EditExperience extends StatefulWidget {
  EditExperience({Key? key, required this.userModel}) : super(key: key);
  final UserModel userModel;

  @override
  _EditExperienceState createState() => _EditExperienceState();
}

class _EditExperienceState extends State<EditExperience> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _sectorController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  var isWork = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deneyim"),
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
                    "Kurum Adı",
                  ),
                ),
                TextField(
                  controller: _nameController,
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
                    "Pozisyon",
                  ),
                ),
                TextField(
                  controller: _positionController,
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
                    "Sektör",
                  ),
                ),
                TextField(
                  controller: _sectorController,
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
                    "Başlangıç Tarihi",
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
                          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        IconButton(
                            onPressed: () {},
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
                    "Bitiş Tarihi",
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
                          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        isWork == false
                            ? IconButton(
                                onPressed: () {},
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
                      const Text("Çalışmaya Devam Ediyorum")
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "İş Açıklaması",
                  ),
                ),
                TextField(
                  controller: _aboutController,
                  maxLines: 4,
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
                ElevatedButton(
                  onPressed: () {
                    widget.userModel.experiences != null
                        ? context.read<UserInfoBloc>().add(UpdateUserExperience(
                                userModel: UserModel(
                              name: widget.userModel.name,
                              surname: widget.userModel.surname,
                              email: widget.userModel.email,
                              experiences: [
                                ...widget.userModel.experiences!,
                                Experience(
                                    about: _aboutController.text,
                                    name: _nameController.text,
                                    position: _positionController.text,
                                    sector: _sectorController.text,
                                    isContinue: isWork)
                              ],
                            )))
                        : context.read<UserInfoBloc>().add(UpdateUserExperience(
                                userModel: UserModel(
                                    name: widget.userModel.name,
                                    surname: widget.userModel.surname,
                                    email: widget.userModel.email,
                                    experiences: [
                                  Experience(
                                      about: _aboutController.text,
                                      name: _nameController.text,
                                      position: _positionController.text,
                                      sector: _sectorController.text,
                                      isContinue: isWork)
                                ])));

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
