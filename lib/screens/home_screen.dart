import 'package:flutter/material.dart';
import 'package:tobeto_app/screens/home_announcement_screen.dart';
import 'package:tobeto_app/screens/home_application_screen.dart';
import 'package:tobeto_app/widgets/home_widgets/announcement_card.dart';
import 'package:tobeto_app/widgets/home_widgets/applications_card.dart';
import 'package:tobeto_app/widgets/home_widgets/education_card.dart';
import 'package:tobeto_app/widgets/home_widgets/empty_card.dart';
import 'package:tobeto_app/widgets/home_widgets/exam_card.dart';
import 'package:tobeto_app/widgets/home_widgets/gradient_card.dart';

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
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hoşgeldin Kullanıcı Adı",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge!.color),
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
              Row(
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
                      width: MediaQuery.of(context).size.width * 0.47,
                      height: MediaQuery.of(context).size.height * 0.1,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).primaryColor.withOpacity(0.8),
                              Theme.of(context).primaryColor,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text("Başvurularım",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      fontWeight: FontWeight.bold))),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.47,
                      height: MediaQuery.of(context).size.height * 0.1,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).primaryColor.withOpacity(0.8),
                              Theme.of(context).primaryColor,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text("Eğitimlerim",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      fontWeight: FontWeight.bold))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeAnnouncement()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.47,
                      height: MediaQuery.of(context).size.height * 0.1,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).primaryColor.withOpacity(0.8),
                              Theme.of(context).primaryColor,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text("Duyurularım",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      fontWeight: FontWeight.bold))),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.47,
                      height: MediaQuery.of(context).size.height * 0.1,
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Theme.of(context).primaryColor,
                              Theme.of(context).primaryColor.withOpacity(0.8),
                              Theme.of(context).primaryColor,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text("Anketlerim",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background,
                                      fontWeight: FontWeight.bold))),
                    ),
                  ),
                ],
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Daha Fazla",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge!.color),
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GradientCard(
                        headLine: "Profilini Oluştur",
                        color1: Color(0xFF1D0B8C),
                        color2: Color(0xFFB49DF8)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    GradientCard(
                        headLine: "Kendini Değerlendir",
                        color1: Color(0xFF0E0B93),
                        color2: Color(0xFF59ACC7)),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    GradientCard(
                        headLine: "Öğrenmeye Başla",
                        color1: Color(0xFF3C0B8C),
                        color2: Color(0xFFDA9DF8)),
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
