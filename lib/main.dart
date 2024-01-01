import 'package:flutter/material.dart';
import 'package:tobeto_app/screens/login_screen.dart';
import 'package:tobeto_app/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      title: 'Tobeto',
      home: const LoginScreen(),
    );
  }
}

// yorum satırı