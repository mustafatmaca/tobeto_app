import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/service_bloc/service_bloc.dart';
import 'package:tobeto_app/blocs/service_bloc/service_event.dart';

class ReviewsHorizontalCard extends StatelessWidget {
  final String headLine;
  final Color color1;
  final Color color2;
  final Color color3;
  String url;

  ReviewsHorizontalCard({
    required this.headLine,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.url,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          bottomRight: Radius.circular(12),
          bottomLeft: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
        gradient: LinearGradient(
          colors: [color1, color2, color3],
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.003),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/edu.png",
                        width: MediaQuery.of(context).size.width * 0.08,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.002),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          headLine,
                          textAlign: TextAlign.start,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                color: Theme.of(context).colorScheme.background,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            height: MediaQuery.of(context).size.height * 0.6,
                            padding: const EdgeInsets.all(16.0),
                            child: ListView(
                              children: [
                                Text(
                                  headLine,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                const Text(
                                    "Bu sınav 5 sorudan oluşmaktadır. Sınav çoktan seçmeli test şeklinde olup boş soru bırakma hakkınız olmamaktadır. Sınava ''Sınava Başla'' butonundan ulaşabilirsiniz. Başarılar! "),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                const Text("Soru Sayısı: 5"),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                const Text("Soru Tipi: Çoktan Seçmeli"),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<ServiceBloc>()
                                          .add(LaunchSocialUrl(url: url));
                                      // Butona tıklandığında yapılacak işlemler
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      backgroundColor: Color(
                                          0xFF011D42), // Z-eğimi sıfır olmalı
                                    ),
                                    child: Text("Sınava Başla"))
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      "Başla",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF011D42),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
          ],
        ),
      ),
    );
  }
}
