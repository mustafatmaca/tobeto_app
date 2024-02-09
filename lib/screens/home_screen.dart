import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/announcement_bloc/announcement_bloc.dart';
import 'package:tobeto_app/blocs/announcement_bloc/announcement_event.dart';
import 'package:tobeto_app/blocs/application_bloc/application_bloc.dart';
import 'package:tobeto_app/blocs/application_bloc/application_event.dart';
import 'package:tobeto_app/blocs/education_bloc/education_bloc.dart';
import 'package:tobeto_app/blocs/education_bloc/education_event.dart';
import 'package:tobeto_app/blocs/exam_bloc/exam_bloc.dart';
import 'package:tobeto_app/blocs/exam_bloc/exam_event.dart';
import 'package:tobeto_app/blocs/exam_bloc/exam_state.dart';
import 'package:tobeto_app/blocs/navigation_bloc/navigation_event.dart';
import 'package:tobeto_app/screens/home/exam_screen.dart';
import 'package:tobeto_app/screens/home/home_announcement_screen.dart';
import 'package:tobeto_app/screens/home/home_application_screen.dart';
import 'package:tobeto_app/screens/home/home_education_screen.dart';
import 'package:tobeto_app/screens/home/home_survey_screen.dart';
import 'package:tobeto_app/screens/home/menu_screen.dart';
import 'package:tobeto_app/screens/profile_screen.dart';
import 'package:tobeto_app/widgets/home_widgets/exam_card.dart';
import 'package:tobeto_app/widgets/home_widgets/gradient_card.dart';
import 'package:tobeto_app/widgets/photo_slider.dart';
import 'package:tobeto_app/blocs/navigation_bloc/navigation_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollMenuController = ScrollController();
  final ScrollController _scrollExamController = ScrollController();
  var currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hoşgeldin!",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text("Kullanıcı Adı",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              )),
                ],
              ),
              // CircleAvatar(
              //     backgroundColor: const Color(0xFF004D79),
              //     child: IconButton(
              //         onPressed: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => const ProfileScreen()));
              //         },
              //         icon: const Icon(Icons.person)))
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        FullWidthPhotoSlider(
          imageAssets: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
              child: const GradientCard(
                  headLine: "Profilini Oluştur",
                  icon: "assets/profile.png",
                  color1: Color(0xFF004D79),
                  color2: Color(0xFF011D42),
                  color3: Color(0xFF341132)),
            ),
            InkWell(
              onTap: () {
                context.read<NavigationBloc>().add(ChangeScreen(index: 1));
              },
              child: const GradientCard(
                  headLine: "Kendini Değerlendir",
                  icon: "assets/review.png",
                  color1: Color(0xFF004D79),
                  color2: Color(0xFF011D42),
                  color3: Color(0xFF341132)),
            ),
            InkWell(
              onTap: () {
                context.read<NavigationBloc>().add(ChangeScreen(index: 2));
              },
              child: const GradientCard(
                  headLine: "Öğrenmeye Başla",
                  icon: "assets/learn.png",
                  color1: Color(0xFF004D79),
                  color2: Color(0xFF011D42),
                  color3: Color(0xFF341132)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuScreen(),
                      ));
                },
                child: Row(
                  children: [
                    Text(
                      "İstanbul Kodluyor",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyLarge!.color),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Scrollbar(
                trackVisibility: false,
                controller: _scrollMenuController,
                child: SingleChildScrollView(
                  controller: _scrollMenuController,
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<ApplicationBloc>()
                                .add(LoadApplication());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HomeApplicationScreen(),
                                ));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.18,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF004D79),
                                    Color(0xFF011D42),
                                    Color(0xFF341132),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/basvurularim.png",
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                                Text("Başvurularım",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                            fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            context.read<EducationBloc>().add(LoadEducation());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HomeEducationScreen()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.18,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF004D79),
                                    Color(0xFF011D42),
                                    Color(0xFF341132),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/egitimlerim.png",
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                                Text("Eğitimlerim",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                            fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            context.read<AnnouncementBloc>().add(LoadAnno());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HomeAnnouncement()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.18,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF004D79),
                                    Color(0xFF011D42),
                                    Color(0xFF341132),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/duyurularim.png",
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                                Text("Duyurularım",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                            fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HomeSurveyScreen()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.18,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF004D79),
                                    Color(0xFF011D42),
                                    Color(0xFF341132),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/anketlerim.png",
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                                Text("Anketlerim",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                            fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              InkWell(
                onTap: () {
                  context.read<ExamBloc>().add(LoadExam());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExamScreen(),
                      ));
                },
                child: Row(
                  children: [
                    Text(
                      "Sınavlarım",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyLarge!.color),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )
                  ],
                ),
              ),
              Scrollbar(
                trackVisibility: false,
                controller: _scrollExamController,
                child: SingleChildScrollView(
                  controller: _scrollExamController,
                  padding: const EdgeInsets.all(2),
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: BlocBuilder<ExamBloc, ExamState>(
                        builder: (context, state) {
                          if (state is ExamInitial) {
                            context.read<ExamBloc>().add(LoadExam());
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is ExamLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is ExamLoaded) {
                            if (state.examList.isEmpty) {
                              return Text("İçerik Bulunamadı!");
                            } else {
                              return Row(
                                children: state.examList
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ExamCard(
                                          examName: e.name,
                                          examClass: e.examClass,
                                          examType: e.examType,
                                          examContent: e.content,
                                          examQuestionNumber: e.questionNumber,
                                          examTime: e.time,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              );
                            }
                          } else if (state is ExamError) {
                            return const Center(
                              child: Text("That's an error"),
                            );
                          } else {
                            return const Center(
                              child: Text("Something went wrong"),
                            );
                          }
                        },
                      )),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
