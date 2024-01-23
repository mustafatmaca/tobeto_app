import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/application_bloc/application_bloc.dart';
import 'package:tobeto_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:tobeto_app/firebase_options.dart';
import 'package:tobeto_app/repository/firebaseAuth_repo.dart';
import 'package:tobeto_app/repository/firestore_repo.dart';
import 'package:tobeto_app/screens/main_screen.dart';
import 'package:tobeto_app/screens/splash/splash_screen.dart';
import 'package:tobeto_app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider<NavigationBloc>(
      create: (context) => NavigationBloc(firebaseAuthRepo: FirebaseAuthRepo()),
    ),
    BlocProvider<ApplicationBloc>(
      create: (context) => ApplicationBloc(fireStoreRepo: FireStoreRepo()),
    )
  ], child: const MyApp()));
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
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MainScreen();
            }
            return SplashScreen();
          },
        ));
  }
}
