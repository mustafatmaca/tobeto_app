import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_event.dart';
import 'package:tobeto_app/models/user.dart';
import 'package:tobeto_app/screens/profile_screen.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class EditSkills extends StatefulWidget {
  EditSkills({Key? key, required this.userModel}) : super(key: key);
  UserModel userModel;

  @override
  _EditSkillsState createState() => _EditSkillsState();
}

class _EditSkillsState extends State<EditSkills> {
  final TextEditingController _skillController = TextEditingController();
  var dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yetkinliklerim"),
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
                    "Yetkinlik",
                  ),
                ),
                TextField(
                  controller: _skillController,
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
                ElevatedButton(
                  onPressed: () {
                    widget.userModel.skills != null
                        ? context.read<UserInfoBloc>().add(UpdateUserSkill(
                                userModel: UserModel(
                                    name: widget.userModel.name,
                                    surname: widget.userModel.surname,
                                    email: widget.userModel.email,
                                    skills: [
                                  ...widget.userModel.skills!,
                                  _skillController.text
                                ])))
                        : context.read<UserInfoBloc>().add(UpdateUserSkill(
                            userModel: UserModel(
                                name: widget.userModel.name,
                                surname: widget.userModel.surname,
                                email: widget.userModel.email,
                                skills: [_skillController.text])));

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
