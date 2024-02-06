import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/photo_slider.dart';
import 'package:tobeto_app/widgets/reviews_widget/reviews_button_card.dart';
import 'package:tobeto_app/widgets/reviews_widget/reviews_horizontal_card.dart';
import 'package:tobeto_app/widgets/reviews_widget/reviews_notbutton_card.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({Key? key}) : super(key: key);

  @override
  _ReviewsScreenState createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Yetkinlik',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                  children: [
                    TextSpan(
                      text: 'lerini ücretsiz ölç, ',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                              fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'bilgi',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    TextSpan(
                      text: 'lerini test et ',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color:
                                  Theme.of(context).textTheme.bodyLarge!.color,
                              fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        const FullWidthPhotoSlider(imageAssets: [
          ReviewsButtonCard(
            headLine: "Tobeto İşte Başarı Modeli",
            explanation:
                '80 Soru ile yetkinliklerini ölç, önerilen eğitimleri tamamla, rozetini kazan',
            color1: Color(0xFF004D79),
            color2: Color(0xFF011D42),
            color3: Color(0xFF341132),
          ),
          ReviewsNotButtonCard(
            headLine: "Yazılımda Başarı Testi",
            explanation: "Çoktan seçmeli sorular ile teknik bilgini test et",
            color1: Color(0xFF004D79),
            color2: Color(0xFF011D42),
            color3: Color(0xFF341132),
          ),
          ReviewsNotButtonCard(
            headLine: "Kazanım Odaklı Testler",
            explanation:
                "Dijital Gelişim kategorisindeki eğitimlere başlamadan önce konuyla ilgili bilgin ölçülür ve seviyene göre yönlendirilirsin.",
            color1: Color(0xFF004D79),
            color2: Color(0xFF011D42),
            color3: Color(0xFF341132),
          ),
          ReviewsNotButtonCard(
            headLine: "Huawei Talent Interview Teknik Bilgi Sınavı*",
            explanation:
                "Sertifika alabilmen için, eğitim yolculuğunun sonuna kadar teknik yetkinliklerin ve kod bilgin ölçülür.",
            color1: Color(0xFF004D79),
            color2: Color(0xFF011D42),
            color3: Color(0xFF341132),
          )
        ]),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ReviewsHorizontalCard(
              headLine: "Front End",
              color1: Color(0xFF004D79),
              color2: Color(0xFF011D42),
              color3: Color(0xFF341132),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ReviewsHorizontalCard(
              headLine: "Full Stack",
              color1: Color(0xFF004D79),
              color2: Color(0xFF011D42),
              color3: Color(0xFF341132),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ReviewsHorizontalCard(
              headLine: "Back End",
              color1: Color(0xFF004D79),
              color2: Color(0xFF011D42),
              color3: Color(0xFF341132),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ReviewsHorizontalCard(
              headLine: "Microsoft SQL Server",
              color1: Color(0xFF004D79),
              color2: Color(0xFF011D42),
              color3: Color(0xFF341132),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            ReviewsHorizontalCard(
              headLine: "Masaüstü Programlama",
              color1: Color(0xFF004D79),
              color2: Color(0xFF011D42),
              color3: Color(0xFF341132),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
      ],
    );
  }
}
