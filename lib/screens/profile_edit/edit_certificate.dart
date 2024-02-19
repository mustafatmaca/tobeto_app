import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  // void _upload(UserModel userModel) async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   final ref = FirebaseStorage.instance
  //       .ref()
  //       .child("files")
  //       .child("${_pickedFile!.path.substring(53)}");

  //   await ref.putFile(_pickedFile!);
  //   final url = await ref.getDownloadURL();

  //   final document =
  //       FirebaseFirestore.instance.collection("users").doc(user!.uid);

  //   if (userModel.certificates != null) {
  //     await document.update(UserModel(
  //         name: userModel.name,
  //         surname: userModel.surname,
  //         email: userModel.email,
  //         certificates: [...userModel.certificates!, url]).toMap());
  //   } else {
  //     await document.update(UserModel(
  //         name: userModel.name,
  //         surname: userModel.surname,
  //         email: userModel.email,
  //         certificates: [url]).toMap());
  //   }
  // }

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
                      context.read<UserInfoBloc>().add(UpdateUserCertificate(
                          userModel: UserModel(
                              name: widget.userModel.name,
                              surname: widget.userModel.surname,
                              email: widget.userModel.email,
                              certificates: widget.userModel.certificates),
                          file: _pickedFile!));

                      Navigator.pop(context);
                      context.read<UserInfoBloc>().add(ResetEvent());
                    },
                    child: Text("Kaydet")),
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
