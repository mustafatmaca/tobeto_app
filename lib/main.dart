import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tobeto_app/blocs/announcement_bloc/announcement_bloc.dart';
import 'package:tobeto_app/blocs/application_bloc/application_bloc.dart';
import 'package:tobeto_app/blocs/carousel_bloc/carousel_bloc.dart';
import 'package:tobeto_app/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:tobeto_app/blocs/education_bloc/education_bloc.dart';
import 'package:tobeto_app/blocs/exam_bloc/exam_bloc.dart';
import 'package:tobeto_app/blocs/lesson_bloc/lesson_bloc.dart';
import 'package:tobeto_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:tobeto_app/blocs/service_bloc/service_bloc.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_bloc.dart';
import 'package:tobeto_app/firebase_options.dart';
import 'package:tobeto_app/repository/firebaseAuth_repo.dart';
import 'package:tobeto_app/repository/firestore_repo.dart';
import 'package:tobeto_app/repository/urlLaunch_service.dart';
import 'package:tobeto_app/screens/login_screen.dart';
import 'package:tobeto_app/screens/main_screen.dart';
import 'package:tobeto_app/screens/splash/splash_screen.dart';
import 'package:tobeto_app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserControllerBloc>(
          create: (context) =>
              UserControllerBloc(firebaseAuthRepo: FirebaseAuthRepo()),
        ),
        BlocProvider<NavigationBloc>(
          create: (context) =>
              NavigationBloc(firebaseAuthRepo: FirebaseAuthRepo()),
        ),
        BlocProvider<ApplicationBloc>(
          create: (context) => ApplicationBloc(fireStoreRepo: FireStoreRepo()),
        ),
        BlocProvider<EducationBloc>(
          create: (context) => EducationBloc(fireStoreRepo: FireStoreRepo()),
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => AnnouncementBloc(fireStoreRepo: FireStoreRepo()),
        ),
        BlocProvider<ExamBloc>(
          create: (context) => ExamBloc(fireStoreRepo: FireStoreRepo()),
        ),
        BlocProvider<ServiceBloc>(
          create: (context) =>
              ServiceBloc(urlLaunchService: UrlLaunchService()),
        ),
        BlocProvider<CarouselBloc>(
          create: (context) => CarouselBloc(),
        ),
        BlocProvider<LessonBloc>(
          create: (context) => LessonBloc(fireStoreRepo: FireStoreRepo()),
        ),
        BlocProvider<CatalogBloc>(
          create: (context) => CatalogBloc(fireStoreRepo: FireStoreRepo()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        title: 'Tobeto',
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MainScreen();
            } else if (prefs.getBool('isOpen') == null ||
                prefs.getBool('isOpen') == false) {
              return SplashScreen();
            }
            return LoginScreen();
          },
        ),
      ),
    ),
  );
}
