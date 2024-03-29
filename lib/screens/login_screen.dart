import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/exam_bloc/exam_bloc.dart';
import 'package:tobeto_app/blocs/exam_bloc/exam_event.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_bloc.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_event.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_state.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_event.dart';
import 'package:tobeto_app/screens/forgot_password_screen.dart';
import 'package:tobeto_app/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
              height: MediaQuery.of(context).size.height * 0.5,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Image.asset(
                        imagePath,
                        width: 150,
                        height: 75,
                      ),
                      const Spacer(),
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
                        onSaved: (newValue) {
                          _usernameController.text = newValue!;
                        },
                      ),
                      const Spacer(),
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
                                    context
                                        .read<UserControllerBloc>()
                                        .add(ShowPassword(visibility: true));
                                  },
                                  child: const Icon(
                                    Icons.visibility,
                                  ),
                                ),
                                label: const Text("Parola"),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: const EdgeInsets.all(8),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Parola Alanı Boş Bırakılamaz";
                                }
                                const Spacer();
                                return null;
                              },
                            );
                          } else if (state is PasswordVisibility) {
                            return TextFormField(
                              controller: _passwordController,
                              obscureText: state.isVisible,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      context.read<UserControllerBloc>().add(
                                          ShowPassword(
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
                                  return "Parola Alanı Boş Bırakılamaz";
                                }

                                return null;
                              },
                            );
                          } else {
                            return TextFormField(
                              controller: _passwordController,
                              obscureText: false,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      context
                                          .read<UserControllerBloc>()
                                          .add(ShowPassword(visibility: true));
                                    },
                                    child: const Icon(
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
                                  return "Parola Alanı Boş Bırakılamaz";
                                }
                                return null;
                              },
                            );
                          }
                        },
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).cardColor,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen()));
                              },
                              child: const Text("Kayıt Ol"),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  context.read<UserControllerBloc>().add(
                                        LoginEvent(
                                          email: _usernameController.text,
                                          password: _passwordController.text,
                                          context: context,
                                        ),
                                      );
                                  context
                                      .read<UserInfoBloc>()
                                      .add(ResetEvent());
                                  context
                                      .read<ExamBloc>()
                                      .add(ResetExamEvent());
                                }
                              },
                              child: const Text("Giriş Yap"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).cardColor,
                                ),
                                onPressed: () {
                                  context
                                      .read<UserControllerBloc>()
                                      .add(SignInWithGoogle());
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/google_icon.png",
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    const Text("Google ile Giriş Yap"),
                                  ],
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      const Divider(height: 0.1),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text("Parolamı Unuttum"),
                      )
                    ],
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
