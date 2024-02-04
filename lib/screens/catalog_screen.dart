import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/catalog_widgets/catalog_card.dart';
import 'package:tobeto_app/widgets/catalog_widgets/filter_button.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  Image img = Image.asset("assets/katalog.png");
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.32,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: img.image,
                  ),
                ),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.black.withOpacity(0.3)),
                  child: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "Öğrenmeye başla !",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              searchText = value;
                            });
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            suffixIcon: const Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: 25.0,
                              ),
                            ),
                            hintText: "Eğitim arayın...",
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              FilterButton(
                filterOptions: const [
                  'Kategori',
                  'Eğitimler',
                  'Seviye',
                  'Konu',
                  'Yazılım Dili',
                  'Eğitmen',
                ],
                onFilterSelected: (selectedFilter) {
                  // Seçilen filtreleme seçeneğine göre katalogu güncelleme işlemleri
                  print("Seçilen filtre: $selectedFilter");
                  // Burada katalogu güncellemek için gerekli işlemleri yapabilirsiniz
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              CatalogCard(
                title: "Dinle, Anla",
                image: "assets/ENK-1.jpg",
                instructor: "Gürkan",
                time: 255,
                isVisible: searchText.isEmpty ||
                    "Dinle, Anla"
                        .toLowerCase()
                        .contains(searchText.toLowerCase()),
              ),
              CatalogCard(
                title: "Hibrit Yaşamda Duyguyu Düzenleme",
                image: "assets/ENK-3.jpg",
                instructor: "Gürkan İlişen",
                time: 53,
                isVisible: searchText.isEmpty ||
                    "Hibrit Yaşamda Duyguyu Düzenleme"
                        .toLowerCase()
                        .contains(searchText.toLowerCase()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
