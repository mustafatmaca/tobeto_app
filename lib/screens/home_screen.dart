import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/home_widgets/announcement_card.dart';
import 'package:tobeto_app/widgets/home_widgets/applications_card.dart';
import 'package:tobeto_app/widgets/home_widgets/education_card.dart';
import 'package:tobeto_app/widgets/home_widgets/empty_card.dart';
import 'package:tobeto_app/widgets/home_widgets/exam_card.dart';
import 'package:tobeto_app/widgets/custom_widgets/footer.dart';
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
        Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "TOBETO",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                          children: <TextSpan>[
                            TextSpan(
                              text: "'ya hoş geldin Kullanıcı Adı",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        "Yeni nesil öğrenme deneyimi ile Tobeto kariyer yolculuğunda senin yanında!",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).textTheme.bodyLarge!.color),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ]),
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/istnblkodluyor.png",
                              width: 200,
                              height: 80,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Text(
                                "Ücretsiz eğitimlerle, geleceğin mesleklerinde sen de yerini al. ",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: "Aradığın ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "${'"'}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                  ),
                                  TextSpan(
                                    text: "İş",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  TextSpan(
                                    text: "${'"'}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                  ),
                                  TextSpan(
                                    text: " Burada! ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: ListView(
                                padding: EdgeInsets.all(8),
                                scrollDirection: Axis.horizontal,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        currentTab = 0;
                                      });
                                    },
                                    child: currentTab == 0
                                        ? Container(
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Center(
                                              child: Text(
                                                "  Başvurularım  ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            child: Center(
                                              child: Text(
                                                "  Başvurularım  ",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          currentTab = 1;
                                        });
                                      },
                                      child: currentTab == 1
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Center(
                                                child: Text(
                                                  "  Eğitimlerim  ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Center(
                                                child: Text(
                                                  "  Eğitimlerim  ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                            )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          currentTab = 2;
                                        });
                                      },
                                      child: currentTab == 2
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Center(
                                                child: Text(
                                                  "  Duyuru ve Haberlerim  ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Center(
                                                child: Text(
                                                  "  Duyuru ve Haberlerim  ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                            )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          currentTab = 3;
                                        });
                                      },
                                      child: currentTab == 3
                                          ? Container(
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.5),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Center(
                                                child: Text(
                                                  "  Anketlerim  ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              child: Center(
                                                child: Text(
                                                  "  Anketlerim  ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                            ))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              child: buildContent(currentTab),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ]),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Text(
                                  "Sınavlarım",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            SingleChildScrollView(
                              padding: EdgeInsets.all(8),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  const ExamCard(
                                      examName:
                                          "Herkes İçin Kodlama 1A Değerlendirme Sınavı",
                                      examClass: "Herkes İçin Kodlama 1A",
                                      examTime: "45 Dakika"),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                  const ExamCard(
                                      examName:
                                          "Herkes İçin Kodlama 1A Değerlendirme Sınavı",
                                      examClass: "Herkes İçin Kodlama 1A",
                                      examTime: "45 Dakika"),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                  const ExamCard(
                                      examName:
                                          "Herkes İçin Kodlama 1A Değerlendirme Sınavı",
                                      examClass: "Herkes İçin Kodlama 1A",
                                      examTime: "45 Dakika"),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                  const ExamCard(
                                      examName:
                                          "Herkes İçin Kodlama 1A Değerlendirme Sınavı",
                                      examClass: "Herkes İçin Kodlama 1A",
                                      examTime: "45 Dakika"),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.04,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView(
                    padding: EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    children: [
                      GradientCard(
                          headLine: "Profilini Oluştur",
                          color1: Color(0xFF1D0B8C),
                          color2: Color(0xFFB49DF8)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      GradientCard(
                          headLine: "Kendini Değerlendir",
                          color1: Color(0xFF0E0B93),
                          color2: Color(0xFF59ACC7)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Footer(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget buildContent(int currentTab) {
    switch (currentTab) {
      case 0:
        return ApplicationsCard(
          title: "İstanbul Kodluyor Bilgilendirme",
          subtitle: "İstanbul Kodluyor Başvuru Formu onaylandı",
          subtitle2: "İstanbul Kodluyor Belge  Yükleme Formu Onaylandı ",
        );
      case 1:
        return Column(
          children: [
            EducationCard(
              context: context,
              title: "Dr. Ecmel Ayral'dan Hoşgeldin Mesajı",
              date: DateTime.now(),
              image: "assets/ecmelayral.jpeg",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            EducationCard(
              context: context,
              title: "Eğitimlere Nasıl Katılırım?",
              date: DateTime.now(),
              image: "assets/istkod.png",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            EducationCard(
              context: context,
              title: "Herkes İçin Kodlama",
              date: DateTime.now(),
              image: "assets/tbt.jpeg",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            EducationCard(
              context: context,
              title: "İstanbul Kodluyor Proje Aşamaları",
              date: DateTime.now(),
              image: "assets/istkod.png",
            ),
          ],
        );
      case 2:
        return AnnouncementCard(
          type: "Duyuru",
          eduType: "İstanbul Kodluyor",
          title: "Yeni Grupların Discorda Katılımı",
          date: DateTime.now(),
        );
      case 3:
        return EmptyCard();
      default:
        return Container(); // Varsayılan durumda boş bir container döndürüyoruz.
    }
  }
}
