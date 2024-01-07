import 'package:flutter/material.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  Image img = Image.asset("assets/edu-banner2.png");
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.fill, image: img.image)),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.3)),
                  child: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Öğrenmeye başla !",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10.0),
                        TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: const Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: 40.0,
                              ),
                            ),
                            hintText: "Eğitim arayın...",
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            contentPadding: const EdgeInsets.all(8),
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Filtrele",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.9,
                    MediaQuery.of(context).size.height * 0.05,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      "assets/ENK-1.jpg",
                      fit: BoxFit.cover,
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 106, 92, 92),
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(19),
                              left: Radius.circular(19))),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Gürkan İlişen",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.access_time,
                                size: 18,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "4s 14dk",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Dinle, Anla, İfade Et: Etkili İletişim Gelişim Yolculuğu",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      right: 12,
                      top: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      "assets/ENK-2.jpg",
                      fit: BoxFit.cover,
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 106, 92, 92),
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(15),
                              left: Radius.circular(15))),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Gürkan İlişen",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.access_time,
                                size: 18,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "40dk",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Sürdürülebilir Bir Dünya için Bireysel Farkındalık",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      right: 12,
                      top: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      "assets/ENK-3.jpg",
                      fit: BoxFit.cover,
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 106, 92, 92),
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(15),
                              left: Radius.circular(15))),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Gürkan İlişen",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.access_time,
                                size: 18,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "53dk",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Hibrit Yaşamda Duyguyu Düzenleme",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      right: 12,
                      top: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      "assets/ENK-4.jpg",
                      fit: BoxFit.cover,
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 106, 92, 92),
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(19),
                              left: Radius.circular(19))),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Gürkan İlişen",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                Icons.access_time,
                                size: 18,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "2s 1dk",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Web Sayfası Tasarımı Nasıl Oluşturulur? - HTML(Temel Seviye)",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      right: 12,
                      top: 10,
                      child: CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
