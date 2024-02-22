import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_event.dart';
import 'package:tobeto_app/models/user.dart';

class EditSocial extends StatefulWidget {
  final UserModel userModel;
  const EditSocial({Key? key, required this.userModel}) : super(key: key);

  @override
  _EditSocialState createState() => _EditSocialState();
}

class _EditSocialState extends State<EditSocial> {
  final TextEditingController _socialController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sosyal Medya"),
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
                      "Sosyal Medya",
                    ),
                  ),
                  TextFormField(
                    controller: _socialController,
                    decoration: InputDecoration(
                        prefixText: 'https://',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Sosyal Medya Alanı Boş Bırakılamaz";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _socialController.text = newValue!,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          widget.userModel.socials != null) {
                        _formKey.currentState!.save();
                        context.read<UserInfoBloc>().add(UpdateUserSocial(
                                userModel: UserModel(
                                    name: widget.userModel.name,
                                    surname: widget.userModel.surname,
                                    email: widget.userModel.email,
                                    socials: [
                                  ...widget.userModel.socials!,
                                  'https://${_socialController.text}'
                                ])));
                        Navigator.pop(context);
                        context.read<UserInfoBloc>().add(ResetEvent());
                      } else if (_formKey.currentState!.validate() &&
                          widget.userModel.socials == null) {
                        _formKey.currentState!.save();
                        context.read<UserInfoBloc>().add(UpdateUserSocial(
                                userModel: UserModel(
                                    name: widget.userModel.name,
                                    surname: widget.userModel.surname,
                                    email: widget.userModel.email,
                                    socials: [
                                  'https://${_socialController.text}'
                                ])));
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
                  widget.userModel.socials != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: widget.userModel.socials!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(FontAwesomeIcons.paperclip),
                              title: Text(
                                widget.userModel.socials![index],
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.userModel.socials!.remove(
                                          widget.userModel.socials![index]);
                                    });
                                    context
                                        .read<UserInfoBloc>()
                                        .add(UpdateUserSocial(
                                            userModel: UserModel(
                                          name: widget.userModel.name,
                                          surname: widget.userModel.surname,
                                          email: widget.userModel.email,
                                          socials: widget.userModel.socials,
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
