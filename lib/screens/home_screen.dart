import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_app/screens/home/home_announcement_screen.dart';
import 'package:tobeto_app/screens/home/home_application_screen.dart';
import 'package:tobeto_app/screens/home/home_education_screen.dart';
import 'package:tobeto_app/screens/home/home_survey_screen.dart';
import 'package:tobeto_app/screens/profile_screen.dart';
import 'package:tobeto_app/widgets/home_widgets/announcement_card.dart';
import 'package:tobeto_app/widgets/home_widgets/applications_card.dart';
import 'package:tobeto_app/widgets/home_widgets/education_card.dart';
import 'package:tobeto_app/widgets/home_widgets/empty_card.dart';
import 'package:tobeto_app/widgets/home_widgets/exam_card.dart';
import 'package:tobeto_app/widgets/home_widgets/gradient_card.dart';
import 'package:tobeto_app/widgets/photo_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              CircleAvatar(
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen()));
                      },
                      icon: Icon(Icons.person)))
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        const FullWidthPhotoSlider(
          imageAssets: [
            GradientCard(
                headLine: "Profilini Oluştur",
                icon: "assets/profile.png",
                color1: Color(0xFF004D79),
                color2: Color(0xFF011D42),
                color3: Color(0xFF341132)),
            GradientCard(
                headLine: "Kendini Değerlendir",
                icon: "assets/review.png",
                color1: Color(0xFF004D79),
                color2: Color(0xFF011D42),
                color3: Color(0xFF341132)),
            GradientCard(
                headLine: "Öğrenmeye Başla",
                icon: "assets/learn.png",
                color1: Color(0xFF004D79),
                color2: Color(0xFF011D42),
                color3: Color(0xFF341132)),
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
                onTap: () {},
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
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeApplicationScreen(),
                            ));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.32,
                        height: MediaQuery.of(context).size.height * 0.18,
                        padding: EdgeInsets.all(18),
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
                              height: MediaQuery.of(context).size.height * 0.1,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeEducationScreen()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.32,
                        height: MediaQuery.of(context).size.height * 0.18,
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
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
                              height: MediaQuery.of(context).size.height * 0.1,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeAnnouncement()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.32,
                        height: MediaQuery.of(context).size.height * 0.18,
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
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
                              height: MediaQuery.of(context).size.height * 0.1,
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
                                builder: (context) => HomeSurveyScreen()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.32,
                        height: MediaQuery.of(context).size.height * 0.18,
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
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
                              height: MediaQuery.of(context).size.height * 0.1,
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              InkWell(
                onTap: () {},
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
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const ExamCard(
                        examName: "Herkes İçin Kodlama 1A Değerlendirme Sınavı",
                        examClass: "Herkes İçin Kodlama 1A",
                        examTime: "45 Dakika"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    const ExamCard(
                        examName: "Herkes İçin Kodlama 1A Değerlendirme Sınavı",
                        examClass: "Herkes İçin Kodlama 1A",
                        examTime: "45 Dakika"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    const ExamCard(
                        examName: "Herkes İçin Kodlama 1A Değerlendirme Sınavı",
                        examClass: "Herkes İçin Kodlama 1A",
                        examTime: "45 Dakika"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    const ExamCard(
                        examName: "Herkes İçin Kodlama 1A Değerlendirme Sınavı",
                        examClass: "Herkes İçin Kodlama 1A",
                        examTime: "45 Dakika"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ],
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

  Widget buildContent(int currentTab) {
    switch (currentTab) {
      case 0:
        return Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ApplicationsCard(
                  title: "İstanbul Kodluyor Bilgilendirme",
                  subtitle: "İstanbul Kodluyor Başvuru Formu onaylandı",
                  subtitle2:
                      "İstanbul Kodluyor Belge  Yükleme Formu Onaylandı ",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ApplicationsCard(
                  title: "İstanbul Kodluyor Bilgilendirme",
                  subtitle: "İstanbul Kodluyor Başvuru Formu onaylandı",
                  subtitle2:
                      "İstanbul Kodluyor Belge  Yükleme Formu Onaylandı ",
                ),
              ),
            ],
          ),
        );
      case 1:
        return Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: EducationCard(
                  context: context,
                  title: "Dr. Ecmel Ayral'dan Hoşgeldin Mesajı",
                  date: DateTime.now(),
                  image: "assets/ecmelayral.jpeg",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: EducationCard(
                  context: context,
                  title: "Eğitimlere Nasıl Katılırım?",
                  date: DateTime.now(),
                  image: "assets/istkod.png",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: EducationCard(
                  context: context,
                  title: "Herkes İçin Kodlama",
                  date: DateTime.now(),
                  image: "assets/tbt.jpeg",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: EducationCard(
                  context: context,
                  title: "İstanbul Kodluyor Proje Aşamaları",
                  date: DateTime.now(),
                  image: "assets/istkod.png",
                ),
              ),
            ],
          ),
        );
      case 2:
        return Container(
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnnouncementCard(
                  type: "Duyuru",
                  eduType: "İstanbul Kodluyor",
                  title: "Yeni Grupların Discorda Katılımı",
                  date: DateTime.now(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnnouncementCard(
                  type: "Duyuru",
                  eduType: "İstanbul Kodluyor",
                  title: "Yeni Grupların Discorda Katılımı",
                  date: DateTime.now(),
                ),
              ),
            ],
          ),
        );
      case 3:
        return EmptyCard();
      default:
        return EmptyCard(); // Varsayılan durumda boş bir container döndürüyoruz.
    }
  }
}
