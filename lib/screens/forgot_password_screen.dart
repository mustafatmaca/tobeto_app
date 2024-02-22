import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_bloc.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_event.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
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
              height: MediaQuery.of(context).size.height * 0.35,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  child: Column(
                    children: [
                      Image.asset(
                        imagePath,
                        width: 150,
                        height: 75,
                      ),
                      const Spacer(),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_outlined),
                          label: const Text("E-Mail"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.all(8),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return " E-Mail Boş Bırakılamaz";
                          }
                          return null;
                        },
                        onSaved: (newValue) =>
                            _emailController.text = newValue!,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<UserControllerBloc>().add(
                                        ForgotPasswordEvent(
                                          email: _emailController.text,
                                          context: context,
                                        ),
                                      );
                                }
                              },
                              child: const Text("E-posta Gönder"),
                            ),
                          ),
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
        ],
      ),
    );
  }
}
