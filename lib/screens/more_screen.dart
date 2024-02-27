import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/navigation_bloc/navigation_bloc.dart';
import 'package:tobeto_app/blocs/navigation_bloc/navigation_event.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_bloc.dart';
import 'package:tobeto_app/blocs/userController_bloc/user_controller_event.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_event.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_state.dart';
import 'package:tobeto_app/screens/contactUsPage_screen.dart';
import 'package:tobeto_app/screens/profile_edit/edit_settings.dart';
import 'package:tobeto_app/screens/profile_screen.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/edu-banner2.png"))),
          height: MediaQuery.of(context).size.height * 1,
        ),
        Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          height: MediaQuery.of(context).size.height * 0.70,
          child: Column(
            children: [
              BlocBuilder<UserInfoBloc, UserInfoState>(
                builder: (context, state) {
                  if (state is UserInfoInitial) {
                    context.read<UserInfoBloc>().add(LoadUser());
                    return Column(
                      children: [
                        Text(
                          "Kullanıcı Yükleniyor",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          "Mail yükleniyor",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.7)),
                        ),
                      ],
                    );
                  } else if (state is UserInfoLoading) {
                    return Column(
                      children: [
                        Text(
                          "Kullanıcı Yükleniyor",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          "Mail yükleniyor",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.7)),
                        ),
                      ],
                    );
                  } else if (state is UserInfoLoaded) {
                    return Column(
                      children: [
                        Text(
                          "${state.userModel.name} ${state.userModel.surname}",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          state.userModel.email,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.7)),
                        ),
                      ],
                    );
                  } else if (state is UserInfoError) {
                    return Column(
                      children: [
                        Text(
                          "Kullanıcı Yüklenemedi",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          "Mail yüklenemedi",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.7)),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Text(
                          "Hata",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          "Hata",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.7)),
                        ),
                      ],
                    );
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              ListTile(
                onTap: () {
                  context.read<UserInfoBloc>().add(LoadUser());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                },
                leading: Icon(
                  Icons.person,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text(
                  "Profil Bilgilerim",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactUsPageScreen()));
                },
                leading: Icon(
                  Icons.feedback,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text(
                  "Bize Başvurun",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditSettings(),
                      ));
                },
                leading: Icon(
                  Icons.settings,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text(
                  "Ayarlar",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const Divider(),
              ListTile(
                onTap: () {
                  context.read<UserControllerBloc>().add(LogoutEvent());
                  context.read<NavigationBloc>().add(ChangeScreen(index: 0));
                },
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text(
                  "Çıkış Yap",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.10,
          child: BlocBuilder<UserInfoBloc, UserInfoState>(
              builder: (context, state) {
            if (state is UserInfoInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserInfoLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UserInfoLoaded) {
              return state.userModel.photoUrl != null
                  ? CircleAvatar(
                      radius: MediaQuery.of(context).size.height * 0.1,
                      backgroundImage: NetworkImage(state.userModel.photoUrl!))
                  : CircleAvatar(
                      radius: MediaQuery.of(context).size.height * 0.1,
                      backgroundImage: const AssetImage("assets/mine.png"));
            } else {
              return const Text("Error");
            }
          }),
        ),
      ],
    );
  }
}
