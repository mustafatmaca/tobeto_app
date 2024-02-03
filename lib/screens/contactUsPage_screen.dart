import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/contact_form.dart';

class ContactUsPageScreen extends StatelessWidget {
  const ContactUsPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('İletişim Bilgileri'),
      ),
      body: ListView(children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Firma Adı: ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                'Tobeto',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Divider(),
              Text(
                'Firma Unvan:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                'Avez Elektronik İletişim Eğitim Danışmanlığı Ticaret Anonim Şirketi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              Divider(),
              Text(
                'Firma Unvan:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Text(
                'Avez Elektronik İletişim Eğitim Danışmanlığı Ticaret Anonim Şirketi',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              Divider(),
              Text(
                'Vergi Dairesi:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                'Beykoz',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              Divider(),
              Text(
                'Vergi No:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                '1050250859',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              Divider(),
              Text(
                'Telefon:	',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                '(0216) 331 48 00',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              Divider(),
              Text(
                'E-Posta:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                'info@tobeto.com',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Divider(),
              Text(
                'Adres:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                'Kavacık, Rüzgarlıbahçe Mah. Çampınarı Sok. No:4 Smart Plaza B Blok Kat:3 34805, Beykoz/İstanbul',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              Divider(),
              Text(
                'İstanbul Kodluyor için Telefon:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                '(0216) 969 22 40',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              Divider(),
              Text(
                'İstanbul Kodluyor için E-Posta:',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                'istanbulkodluyor@tobeto.com',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              Divider(),
            ],
          ),
        ),
        Center(
            child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return ContactForm();
                    },
                  );
                },
                style: ButtonStyle(),
                child: const Text("Mesaj Bırakın")))
      ]),
    );
  }
}
