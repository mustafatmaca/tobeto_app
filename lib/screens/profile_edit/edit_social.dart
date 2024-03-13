import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_event.dart';
import 'package:tobeto_app/models/user.dart';

const List<String> list = <String>[
  'Instagram',
  'Twitter',
  'Linkedin',
  'GitHub'
];
const List<String> prefix = <String>[
  'https://instagram.com/',
  'https://twitter.com/',
  'https://linkedin.com/',
  'https://github.com/'
];

class EditSocial extends StatefulWidget {
  final UserModel userModel;
  const EditSocial({Key? key, required this.userModel}) : super(key: key);

  @override
  _EditSocialState createState() => _EditSocialState();
}

class _EditSocialState extends State<EditSocial> {
  final TextEditingController _socialController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var dropdownValue = list.first;
  var changePrefix = prefix.first;
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
                              value == "Instagram"
                                  ? changePrefix = prefix[0]
                                  : value == "Twitter"
                                      ? changePrefix = prefix[1]
                                      : value == "Linkedin"
                                          ? changePrefix = prefix[2]
                                          : changePrefix = prefix[3];
                              dropdownValue = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sosyal Medya",
                    ),
                  ),
                  TextFormField(
                    controller: _socialController,
                    decoration: InputDecoration(
                        prefixText: changePrefix,
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
                    onSaved: (newValue) =>
                        _socialController.text = "${changePrefix}${newValue!}",
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
                                  '${_socialController.text}'
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
                                socials: ['${_socialController.text}'])));
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
                                                    widget.userModel.socials!
                                                        .remove(widget.userModel
                                                            .socials![index]);
                                                  });
                                                  context
                                                      .read<UserInfoBloc>()
                                                      .add(UpdateUserSocial(
                                                          userModel: UserModel(
                                                        name: widget
                                                            .userModel.name,
                                                        surname: widget
                                                            .userModel.surname,
                                                        email: widget
                                                            .userModel.email,
                                                        socials: widget
                                                            .userModel.socials,
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
