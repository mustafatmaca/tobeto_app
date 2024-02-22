import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/exam_bloc/exam_bloc.dart';
import 'package:tobeto_app/blocs/exam_bloc/exam_event.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_bloc.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_event.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_state.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_event.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    String imagePath =
        isDarkMode ? "assets/dark.png" : "assets/tobeto-logo.png";
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.png"), fit: BoxFit.fill),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          imagePath,
                          width: 150,
                          height: 75,
                        ),
                        TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person_outline),
                            label: const Text("Ad"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: const EdgeInsets.all(8),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 3) {
                              return "Ad Alanı Boş Bırakılamaz.";
                            }
                            return null;
                          },
                          onSaved: (newValue) =>
                              _nameController.text = newValue!,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        TextFormField(
                          controller: _surnameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person_outline),
                            label: const Text("Soyad"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: const EdgeInsets.all(8),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Soyad Alanı Boş Bırakılamaz.";
                            }
                            return null;
                          },
                          onSaved: (newValue) =>
                              _surnameController.text = newValue!,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        TextFormField(
                          controller: _usernameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person_outline),
                            label: const Text("E-Mail"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            contentPadding: const EdgeInsets.all(8),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "E-Mail Alanı Boş Bırakılamaz.";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return "Lütfen Geçerli Bir E-Posta Giriniz";
                            }
                            return null;
                          },
                          onSaved: (newValue) =>
                              _usernameController.text = newValue!,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        BlocBuilder<UserControllerBloc, UserControllerState>(
                          builder: (context, state) {
                            if (state is UserControllerInitial) {
                              return TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        context.read<UserControllerBloc>().add(
                                            ShowPasswordRegister(
                                                visibility: false));
                                      },
                                      child: Icon(
                                        Icons.visibility,
                                      ),
                                    ),
                                    label: const Text("Parola"),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    contentPadding: const EdgeInsets.all(8)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Parola Alanı Boş Bırakılamaz.";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) =>
                                    _passwordController.text = newValue!,
                              );
                            } else if (state is PasswordVisibilityRegister) {
                              return TextFormField(
                                controller: _passwordController,
                                obscureText: state.isVisible,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        context.read<UserControllerBloc>().add(
                                            ShowPasswordRegister(
                                                visibility: !state.isVisible));
                                      },
                                      child: Icon(
                                        state.isVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                    ),
                                    label: const Text("Parola"),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    contentPadding: const EdgeInsets.all(8)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Parola Alanı Boş Bırakılamaz.";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) =>
                                    _passwordController.text = newValue!,
                              );
                            } else {
                              return TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        context.read<UserControllerBloc>().add(
                                            ShowPasswordRegister(
                                                visibility: false));
                                      },
                                      child: Icon(
                                        Icons.visibility,
                                      ),
                                    ),
                                    label: const Text("Parola"),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    contentPadding: const EdgeInsets.all(8)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Parola Alanı Boş Bırakılamaz.";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) =>
                                    _passwordController.text = newValue!,
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        BlocBuilder<UserControllerBloc, UserControllerState>(
                          builder: (context, state) {
                            if (state is UserControllerInitial) {
                              return TextFormField(
                                controller: _confirmPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        context.read<UserControllerBloc>().add(
                                            ShowPasswordRegister(
                                                visibility: false));
                                      },
                                      child: Icon(
                                        Icons.visibility,
                                      ),
                                    ),
                                    label: const Text("Parolayı Doğrula"),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    contentPadding: const EdgeInsets.all(8)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Parola Doğrulama Alanı Boş Bırakılamaz.";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) =>
                                    _confirmPasswordController.text = newValue!,
                              );
                            } else if (state is PasswordVisibilityRegister) {
                              return TextFormField(
                                controller: _confirmPasswordController,
                                obscureText: state.isVisible,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        context.read<UserControllerBloc>().add(
                                            ShowPasswordRegister(
                                                visibility: !state.isVisible));
                                      },
                                      child: Icon(
                                        state.isVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                    ),
                                    label: const Text("Parolayı Doğrula"),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    contentPadding: const EdgeInsets.all(8)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Parola Doğrulama Alanı Boş Bırakılamaz.";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) =>
                                    _confirmPasswordController.text = newValue!,
                              );
                            } else {
                              return TextFormField(
                                controller: _confirmPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        context.read<UserControllerBloc>().add(
                                            ShowPasswordRegister(
                                                visibility: false));
                                      },
                                      child: Icon(
                                        Icons.visibility,
                                      ),
                                    ),
                                    label: const Text("Parolayı Doğrula"),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    contentPadding: const EdgeInsets.all(8)),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Parola Doğrulama Alanı Boş Bırakılamaz.";
                                  }
                                  return null;
                                },
                                onSaved: (newValue) =>
                                    _confirmPasswordController.text = newValue!,
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    context
                                        .read<UserControllerBloc>()
                                        .add(RegisterEvent(
                                          name: _nameController.text,
                                          surname: _surnameController.text,
                                          email: _usernameController.text,
                                          password: _passwordController.text,
                                          confirmPassword:
                                              _confirmPasswordController.text,
                                          context: context,
                                        ));
                                    context
                                        .read<UserInfoBloc>()
                                        .add(ResetEvent());
                                    context
                                        .read<ExamBloc>()
                                        .add(ResetExamEvent());
                                  }
                                },
                                child: const Text("Kayıt Ol"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Hesabın var mı? "),
                            InkWell(
                              child: Text(
                                "Giriş Yap",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
