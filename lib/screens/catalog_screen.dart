import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/catalog_bloc/catalog_bloc.dart';
import 'package:tobeto_app/blocs/catalog_bloc/catalog_event.dart';
import 'package:tobeto_app/blocs/catalog_bloc/catalog_state.dart';
import 'package:tobeto_app/widgets/catalog_widgets/catalog_card.dart';
import 'package:tobeto_app/widgets/catalog_widgets/filter_button.dart';
import 'package:tobeto_app/widgets/home_widgets/empty_card.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  Image img = Image.asset("assets/katalog.png");

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
                          onChanged: (value) {},
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
              BlocBuilder<CatalogBloc, CatalogState>(
                builder: (context, state) {
                  if (state is CatalogInitial) {
                    context.read<CatalogBloc>().add(LoadCatalog());
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CatalogLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is CatalogLoaded) {
                    return ListView.builder(
                      itemCount: state.catalogs.length,
                      itemBuilder: (context, index) {
                        return CatalogCard(
                            title: state.catalogs[index].title,
                            image: state.catalogs[index].image,
                            instructor: state.catalogs[index].instructor,
                            time: state.catalogs[index].time);
                      },
                    );
                  } else if (state is CatalogError) {
                    return EmptyCard();
                  } else {
                    return Text("Error");
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
