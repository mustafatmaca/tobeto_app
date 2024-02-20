import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_event.dart';
import 'package:tobeto_app/models/user.dart';

class EditPersonal extends StatefulWidget {
  final UserModel userModel;
  const EditPersonal({Key? key, required this.userModel}) : super(key: key);

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
  var imagePath;
  DateTime? birthDate = DateTime.now();
  File? _pickedFile;

  @override
  void initState() {
    renameName();
    super.initState();
  }

  void renameName() {
    _nameController.text = widget.userModel.name;
    _aboutController.text = widget.userModel.about ?? '';
    _surnameController.text = widget.userModel.surname;
    _gsmController.text = widget.userModel.gsm ?? '';
    _adressController.text = widget.userModel.adress ?? '';
    _emailController.text = widget.userModel.email;
    imagePath = widget.userModel.photoUrl;
    birthDate = widget.userModel.birthdate != null
        ? DateTime.fromMillisecondsSinceEpoch(
            widget.userModel.birthdate!.millisecondsSinceEpoch)
        : DateTime.now();
  }

  void birthDatePicker() async {
    var date = await showDatePicker(
      context: context,
      initialDate: birthDate,
      firstDate: DateTime(2000, 1, 1),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      changeBirthDateText(date);
    }
  }

  void changeBirthDateText(date) {
    setState(() {
      birthDate = date;
    });
  }

  void _pickImage() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery, imageQuality: 50, maxWidth: 150);
    if (image != null) {
      setState(() {
        _pickedFile = File(image.path);
      });
    }
  }

  // void _upload() async {
  //   final user = FirebaseAuth.instance.currentUser;
  //   final ref = FirebaseStorage.instance
  //       .ref()
  //       .child("images")
  //       .child("${user!.uid}.jpg");

  //   await ref.putFile(_pickedFile!);
  //   final url = await ref.getDownloadURL();

  //   final document =
  //       FirebaseFirestore.instance.collection("users").doc(user.uid);

  //   await document.update({'photoUrl': url});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hakkımda"),
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
                InkWell(
                  onTap: () {
                    _pickImage();
                  },
                  child: imagePath != null
                      ? CircleAvatar(
                          radius: MediaQuery.of(context).size.height * 0.08,
                          backgroundImage: NetworkImage(imagePath))
                      : CircleAvatar(
                          radius: MediaQuery.of(context).size.height * 0.08,
                          backgroundImage: const AssetImage("assets/mine.png")),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Align(
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
                    contentPadding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Align(
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
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Align(
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
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Align(
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
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02,
                        right: MediaQuery.of(context).size.width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${birthDate!.day}/${birthDate!.month}/${birthDate!.year}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        IconButton(
                            onPressed: () {
                              birthDatePicker();
                            },
                            icon: const Icon(Icons.calendar_month)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Align(
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
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Align(
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
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Align(
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
                      contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_nameController.text != "" &&
                        _nameController.text.length >= 3 &&
                        _pickedFile != null &&
                        _surnameController.text != "" &&
                        _surnameController.text.length >= 3 &&
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(_emailController.text)) {
                      context.read<UserInfoBloc>().add(UpdateAboutUser(
                            userModel: UserModel(
                                name: _nameController.text,
                                surname: _surnameController.text,
                                email: _emailController.text,
                                gsm: _gsmController.text,
                                birthdate: Timestamp.fromDate(birthDate!),
                                adress: _adressController.text,
                                about: _aboutController.text),
                            file: _pickedFile!,
                          ));
                      Navigator.pop(context);
                      context.read<UserInfoBloc>().add(ResetEvent());
                    } else if (_nameController.text != "" &&
                        _nameController.text.length >= 3 &&
                        _pickedFile == null &&
                        _surnameController.text != "" &&
                        _surnameController.text.length >= 3 &&
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(_emailController.text)) {
                      context.read<UserInfoBloc>().add(UpdateAboutUser(
                            userModel: UserModel(
                                name: _nameController.text,
                                surname: _surnameController.text,
                                email: _emailController.text,
                                gsm: _gsmController.text,
                                birthdate: Timestamp.fromDate(birthDate!),
                                adress: _adressController.text,
                                about: _aboutController.text),
                          ));
                      Navigator.pop(context);
                      context.read<UserInfoBloc>().add(ResetEvent());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Hatalı Bilgi Girişi Yaptınız!"),
                      ));
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
