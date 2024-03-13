import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_event.dart';
import 'package:tobeto_app/models/user.dart';

class EditLanguage extends StatefulWidget {
  final UserModel userModel;
  const EditLanguage({Key? key, required this.userModel}) : super(key: key);

  @override
  _EditLanguageState createState() => _EditLanguageState();
}

class _EditLanguageState extends State<EditLanguage> {
  final TextEditingController _languageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dil"),
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
                      "Dil Giriniz",
                    ),
                  ),
                  TextFormField(
                    controller: _languageController,
                    decoration: InputDecoration(
                        hintText: "Örn. İngilizce ",
                        hintStyle: Theme.of(context).textTheme.bodyLarge,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * 0.02)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return " Dil Boş Bırakılamaz";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _languageController.text = newValue!,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          widget.userModel.languages != null) {
                        _formKey.currentState!.save();
                        bool hasDuplicate = false;
                        for (var e in widget.userModel.languages!) {
                          if (e.toString().toUpperCase() ==
                              _languageController.text.toUpperCase()) {
                            hasDuplicate = true;
                            break;
                          }
                        }
                        if (hasDuplicate) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Aynı içeriği giremezsiniz!")));
                        } else {
                          context.read<UserInfoBloc>().add(UpdateUserLanguage(
                                  userModel: UserModel(
                                      name: widget.userModel.name,
                                      surname: widget.userModel.surname,
                                      email: widget.userModel.email,
                                      languages: [
                                    ...widget.userModel.languages!,
                                    _languageController.text
                                  ])));
                          Navigator.pop(context);
                          context.read<UserInfoBloc>().add(ResetEvent());
                        }
                      } else if (_formKey.currentState!.validate() &&
                          widget.userModel.languages == null) {
                        _formKey.currentState!.save();
                        context.read<UserInfoBloc>().add(UpdateUserLanguage(
                            userModel: UserModel(
                                name: widget.userModel.name,
                                surname: widget.userModel.surname,
                                email: widget.userModel.email,
                                languages: [_languageController.text])));

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
                  widget.userModel.languages != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: widget.userModel.languages!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: const Icon(FontAwesomeIcons.earthEurope),
                              title: Text(
                                widget.userModel.languages![index]!,
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
                                                    widget.userModel.languages!
                                                        .remove(widget.userModel
                                                            .languages![index]);
                                                  });
                                                  context
                                                      .read<UserInfoBloc>()
                                                      .add(UpdateUserLanguage(
                                                          userModel: UserModel(
                                                        name: widget
                                                            .userModel.name,
                                                        surname: widget
                                                            .userModel.surname,
                                                        email: widget
                                                            .userModel.email,
                                                        languages: widget
                                                            .userModel
                                                            .languages,
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
