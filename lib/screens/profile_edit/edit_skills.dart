import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_event.dart';
import 'package:tobeto_app/models/user.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class EditSkills extends StatefulWidget {
  final UserModel userModel;
  EditSkills({Key? key, required this.userModel}) : super(key: key);

  @override
  _EditSkillsState createState() => _EditSkillsState();
}

class _EditSkillsState extends State<EditSkills> {
  final TextEditingController _skillController = TextEditingController();
  var dropdownValue = list.first;
  final _formKey = GlobalKey<FormState>();
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
        child: Form(
          key: _formKey,
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
                  TextFormField(
                    controller: _skillController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Yetkinlik Boş Bırakılamaz";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _skillController.text = newValue!,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          widget.userModel.skills != null) {
                        _formKey.currentState!.save();
                        context.read<UserInfoBloc>().add(UpdateUserSkill(
                                userModel: UserModel(
                                    name: widget.userModel.name,
                                    surname: widget.userModel.surname,
                                    email: widget.userModel.email,
                                    skills: [
                                  ...widget.userModel.skills!,
                                  _skillController.text
                                ])));
                        Navigator.pop(context);
                        context.read<UserInfoBloc>().add(ResetEvent());
                      } else if (_formKey.currentState!.validate() &&
                          widget.userModel.skills == null) {
                        _formKey.currentState!.save();
                        context.read<UserInfoBloc>().add(UpdateUserSkill(
                            userModel: UserModel(
                                name: widget.userModel.name,
                                surname: widget.userModel.surname,
                                email: widget.userModel.email,
                                skills: [_skillController.text])));

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
                  widget.userModel.skills != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: widget.userModel.skills!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading:
                                  const Icon(FontAwesomeIcons.bookBookmark),
                              title: Text(
                                widget.userModel.skills![index],
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.userModel.skills!.remove(
                                          widget.userModel.skills![index]);
                                    });
                                    context
                                        .read<UserInfoBloc>()
                                        .add(UpdateUserSkill(
                                            userModel: UserModel(
                                          name: widget.userModel.name,
                                          surname: widget.userModel.surname,
                                          email: widget.userModel.email,
                                          skills: widget.userModel.skills,
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
