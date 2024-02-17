import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                TextField(
                  controller: _socialController,
                  decoration: InputDecoration(
                      prefixText: 'https://',
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
                    widget.userModel.socials != null
                        ? context.read<UserInfoBloc>().add(UpdateUserSocial(
                                userModel: UserModel(
                                    name: widget.userModel.name,
                                    surname: widget.userModel.surname,
                                    email: widget.userModel.email,
                                    socials: [
                                  ...widget.userModel.socials!,
                                  _socialController.text
                                ])))
                        : context.read<UserInfoBloc>().add(UpdateUserSocial(
                                userModel: UserModel(
                                    name: widget.userModel.name,
                                    surname: widget.userModel.surname,
                                    email: widget.userModel.email,
                                    socials: [
                                  'https://${_socialController.text}'
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
