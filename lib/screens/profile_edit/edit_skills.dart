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
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        if (widget.userModel.skills != null) {
                          bool hasDuplicate = false;
                          for (var e in widget.userModel.skills!) {
                            if (e.toString().toUpperCase() ==
                                _skillController.text.toUpperCase()) {
                              hasDuplicate = true;
                              break;
                            }
                          }
                          if (hasDuplicate) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Aynı içeriği giremezsiniz!")));
                          } else {
                            context.read<UserInfoBloc>().add(UpdateUserSkill(
                                  userModel: UserModel(
                                    name: widget.userModel.name,
                                    surname: widget.userModel.surname,
                                    email: widget.userModel.email,
                                    skills: [
                                      ...widget.userModel.skills!,
                                      _skillController.text
                                    ],
                                  ),
                                ));
                            Navigator.pop(context);
                          }
                        } else {
                          context.read<UserInfoBloc>().add(UpdateUserSkill(
                                userModel: UserModel(
                                  name: widget.userModel.name,
                                  surname: widget.userModel.surname,
                                  email: widget.userModel.email,
                                  skills: [_skillController.text],
                                ),
                              ));
                          Navigator.pop(context);
                        }
                        context.read<UserInfoBloc>().add(ResetEvent());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF011D42),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width * 0.9,
                        MediaQuery.of(context).size.height * 0.06,
                      ),
                    ),
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
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          elevation: 0,
                                          backgroundColor: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          title: Text("UYARI!",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          content: Text(
                                              "Silmek istediğinize emin misiniz?",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    widget.userModel.skills!
                                                        .remove(widget.userModel
                                                            .skills![index]);
                                                  });
                                                  context
                                                      .read<UserInfoBloc>()
                                                      .add(UpdateUserSkill(
                                                          userModel: UserModel(
                                                        name: widget
                                                            .userModel.name,
                                                        surname: widget
                                                            .userModel.surname,
                                                        email: widget
                                                            .userModel.email,
                                                        skills: widget
                                                            .userModel.skills,
                                                      )));
                                                  context
                                                      .read<UserInfoBloc>()
                                                      .add(ResetEvent());
                                                  Navigator.pop(context);
                                                },
                                                style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.red),
                                                child: Text("Evet",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .background))),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color(0xFF011D42),
                                                ),
                                                child: Text("Hayır",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .background))),
                                          ],
                                        );
                                      },
                                    );
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
