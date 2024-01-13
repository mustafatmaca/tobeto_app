import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tobeto_app/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

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
                child: Column(
                  children: [
                    Image.asset(
                      imagePath,
                      width: 150,
                      height: 75,
                    ),
                    const Spacer(),
                    TextField(
                      controller: _usernameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_outline),
                        label: const Text("Kullanıcı Ad"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.all(8),
                      ),
                    ),
                    const Spacer(),
                    TextField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            child: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          label: const Text("Parola"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          contentPadding: const EdgeInsets.all(8)),
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
                            onPressed: () {},
                            child: const Text("Kayıt Ol"),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainScreen(),
                                  ),
                                );
                              },
                              child: const Text("Giriş Yap")),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: Theme.of(context).cardColor,
                          foregroundColor: Theme.of(context).iconTheme.color,
                          child: FaIcon(FontAwesomeIcons.google),
                        ),
                        CircleAvatar(
                          backgroundColor: Theme.of(context).cardColor,
                          foregroundColor: Theme.of(context).iconTheme.color,
                          child: FaIcon(FontAwesomeIcons.microsoft),
                        ),
                        CircleAvatar(
                          backgroundColor: Theme.of(context).cardColor,
                          foregroundColor: Theme.of(context).iconTheme.color,
                          child: FaIcon(FontAwesomeIcons.github),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const Divider(height: 0.1),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text("Parolamı Unuttum"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
