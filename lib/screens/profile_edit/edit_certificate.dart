import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_event.dart';
import 'package:tobeto_app/models/user.dart';

class EditCertificate extends StatefulWidget {
  final UserModel userModel;
  const EditCertificate({Key? key, required this.userModel}) : super(key: key);

  @override
  _EditCertificateState createState() => _EditCertificateState();
}

class _EditCertificateState extends State<EditCertificate> {
  File? _pickedFile;

  void _pickPdf() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    if (result != null) {
      setState(() {
        _pickedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sertifikalarım"),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    _pickPdf();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_upload,
                          size: MediaQuery.of(context).size.width * 0.1,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        const Text("Dosya Yükle")
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(_pickedFile != null
                    ? _pickedFile!.path
                    : "Dosya Ekleyiniz"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (widget.userModel.certificates != null &&
                          _pickedFile != null) {
                        context.read<UserInfoBloc>().add(UpdateUserCertificate(
                            userModel: UserModel(
                                name: widget.userModel.name,
                                surname: widget.userModel.surname,
                                email: widget.userModel.email,
                                certificates: widget.userModel.certificates),
                            file: _pickedFile!));
                        Navigator.pop(context);
                        context.read<UserInfoBloc>().add(ResetEvent());
                      } else if (widget.userModel.certificates == null &&
                          _pickedFile != null) {
                        context.read<UserInfoBloc>().add(UpdateUserCertificate(
                            userModel: UserModel(
                                name: widget.userModel.name,
                                surname: widget.userModel.surname,
                                email: widget.userModel.email,
                                certificates: []),
                            file: _pickedFile!));
                        Navigator.pop(context);
                        context.read<UserInfoBloc>().add(ResetEvent());
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Bir Dosya Seçmelisiniz"),
                        ));
                      }
                    },
                    child: const Text("Kaydet")),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                widget.userModel.certificates != null
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: widget.userModel.certificates!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(FontAwesomeIcons.scroll),
                            title: Text(
                              widget.userModel.certificates![index]!,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            trailing: IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget.userModel.certificates!.remove(
                                        widget.userModel.certificates![index]);
                                  });
                                  context
                                      .read<UserInfoBloc>()
                                      .add(UpdateUserCertificate(
                                          userModel: UserModel(
                                        name: widget.userModel.name,
                                        surname: widget.userModel.surname,
                                        email: widget.userModel.email,
                                        certificates:
                                            widget.userModel.certificates,
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
    );
  }
}
