import 'package:flutter/material.dart';
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
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        const ReviewsButtonCard(
          headLine: "Tobeto İşte Başarı Modeli",
          explanation:
              '80 Soru ile yetkinliklerini ölç, önerilen eğitimleri tamamla, rozetini kazan',
          color1: Color(0xFF1D0B8C),
          color2: Color(0xFFB49DF8),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        const ReviewsNotButtonCard(
          headLine: "Yazılımda Başarı Testi",
          explanation: "Çoktan seçmeli sorular ile teknik bilgini test et",
          color1: Color(0xFF1D0B8C),
          color2: Color(0xFFB49DF8),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        const ReviewsHorizontalCard(
            headLine: "Front End",
            color1: Color(0xFF3C0B8C),
            color2: Color(0xFFDA9DF8)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        const ReviewsHorizontalCard(
          headLine: "Full Stack",
          color1: Color(0xFF3C0B8C),
          color2: Color(0xFFDA9DF8),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        const ReviewsHorizontalCard(
          headLine: "Back End",
          color1: Color(0xFF3C0B8C),
          color2: Color(0xFFDA9DF8),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        const ReviewsHorizontalCard(
          headLine: "Microsoft SQL Server",
          color1: Color(0xFF3C0B8C),
          color2: Color(0xFFDA9DF8),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        const ReviewsHorizontalCard(
          headLine: "Masaüstü Programlama",
          color1: Color(0xFF3C0B8C),
          color2: Color(0xFFDA9DF8),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        const ReviewsNotButtonCard(
          headLine: "Kazanım Odaklı Testler",
          explanation:
              "Dijital Gelişim kategorisindeki eğitimlere başlamadan önce konuyla ilgili bilgin ölçülür ve seviyene göre yönlendirilirsin.",
          color1: Color(0xFF1D0B8C),
          color2: Color(0xFFB49DF8),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        const ReviewsNotButtonCard(
            headLine: "Huawei Talent Interview Teknik Bilgi Sınavı*",
            explanation:
                "Sertifika alabilmen için, eğitim yolculuğunun sonuna kadar teknik yetkinliklerin ve kod bilgin ölçülür.  4400+ soru | 30+ programlama dili 4 zorluk seviyesi . *Türkiye Ar - Ge Merkezi tarafından tasarlanmıştır.",
            color1: Color(0xFF3C0B8C),
            color2: Color(0xFFDA9DF8))
      ],
    );
  }
}
