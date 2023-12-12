import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/tobeto-logo.png",
                  width: 150,
                  height: 75,
                ),
                const Spacer(),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person_outline),
                    label: const Text("Kullanıcı Adı"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.all(8),
                  ),
                ),
                const Spacer(),
                TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                      label: const Text("Parola"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.all(8)),
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Giriş Yap")),
                const Spacer(),
                const Divider(height: 0.1),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: const Text("Parolamı Unuttum"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
