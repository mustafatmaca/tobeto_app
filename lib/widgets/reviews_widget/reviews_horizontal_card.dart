import 'package:flutter/material.dart';

class ReviewsHorizontalCard extends StatelessWidget {
  final String headLine;
  final Color color1;
  final Color color2;
  final Color color3;

  const ReviewsHorizontalCard({
    required this.headLine,
    required this.color1,
    required this.color2,
    required this.color3,
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
                                  "Bu sınav 25 sorudan oluşmakta olup sınav süresi 30 dakikadır. Sınav çoktan seçmeli test şeklinde olup sınavı yarıda bıraktığınız taktırde çözdüğünüz kısım kadarıyla değerlendirileceksiniz.",
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                const Text("Sınav Süresi: 30"),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                const Text("Soru Sayısı: 25"),
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
                                    // Butona tıklandığında yapılacak işlemler
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    primary: Colors
                                        .transparent, // Arka plan rengi şeffaf olmalı
                                    elevation: 0, // Z-eğimi sıfır olmalı
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height: MediaQuery.of(context).size.height *
                                        0.050,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFF004D79),
                                          Color(0xFF011D42),
                                          Color(0xFF341132),
                                        ], // Gradient renkleri
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Sınava Başla',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white, // Yazı rengi
                                        ),
                                      ),
                                    ),
                                  ),
                                )
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
