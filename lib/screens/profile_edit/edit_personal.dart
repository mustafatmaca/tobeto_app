import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_event.dart';
import 'package:tobeto_app/models/user.dart';
import 'package:tobeto_app/repository/firestore_repo.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class EditPersonal extends StatefulWidget {
  const EditPersonal({Key? key}) : super(key: key);

  @override
  _EditPersonalState createState() => _EditPersonalState();
}

class _EditPersonalState extends State<EditPersonal> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _gsmController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  File? _pickedFile;
  UserModel? user;
  @override
  void initState() {
    renameName();
    super.initState();
  }

  void renameName() async {
    user = await FireStoreRepo().getUser();
    _nameController.text = user!.name;
    _aboutController.text = user!.about!;
    _surnameController.text = user!.surname;
    _gsmController.text = user!.gsm!;
    _adressController.text = user!.adress!;
    _emailController.text = user!.email;
  }

  void _pickImage() async {
    final image = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 150);
    if (image != null) {
      setState(() {
        _pickedFile = File(image.path);
      });
    }
  }

  void _upload() async {
    final user = FirebaseAuth.instance.currentUser;
    final ref = FirebaseStorage.instance
        .ref()
        .child("images")
        .child("${user!.uid}.jpg");

    await ref.putFile(_pickedFile!);
    final url = await ref.getDownloadURL();
    print(url);

    final document =
        FirebaseFirestore.instance.collection("users").doc(user.uid);

    await document.update({'photoUrl': url});
  }

  var dropdownValue = list.first;
  var dropdownValueSecond = list.first;
  var imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hakkımda"),
        scrolledUnderElevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: ListView(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    _pickImage();
                  },
                  child: CircleAvatar(
                    maxRadius: 32,
                    child: imagePath != null
                        ? Image.asset(
                            imagePath,
                            width: 150,
                            height: 75,
                          )
                        : Icon(Icons.person),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Ad",
                  ),
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.all(8),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Soyad",
                  ),
                ),
                TextField(
                  controller: _surnameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.all(8)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Telefon Numarası",
                  ),
                ),
                TextField(
                  controller: _gsmController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.all(8)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Doğum Tarihiniz",
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black38),
                      borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        IconButton(
                            onPressed: () {
                              DatePickerDialog(
                                  firstDate: DateTime(1970),
                                  lastDate: DateTime(2006));
                            },
                            icon: const Icon(Icons.calendar_month)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "E-Posta",
                  ),
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.all(8)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Adres",
                  ),
                ),
                TextField(
                  controller: _adressController,
                  maxLines: 4,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.all(8)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Hakkımda",
                  ),
                ),
                TextField(
                  controller: _aboutController,
                  maxLines: 4,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.all(8)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<UserInfoBloc>().add(UpdateAboutUser(
                        userModel: UserModel(
                            name: _nameController.text,
                            surname: _surnameController.text,
                            email: _emailController.text,
                            gsm: _gsmController.text,
                            adress: _adressController.text,
                            about: _aboutController.text)));
                    _upload();
                  },
                  child: Text("Kaydet"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF011D42),
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.9,
                      MediaQuery.of(context).size.height * 0.06,
                    ),
                  ),
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
