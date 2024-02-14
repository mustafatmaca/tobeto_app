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
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Firma Adı: ',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Tobeto',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w200),
              ),
              Divider(color: Colors.grey[700], thickness: 1.5),
              Text(
                'Firma Unvan:',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Avez Elektronik İletişim Eğitim Danışmanlığı Ticaret Anonim Şirketi',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w200),
              ),
              Divider(color: Colors.grey[700], thickness: 1.5),
              Text(
                'Vergi Dairesi:',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Beykoz',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w200),
              ),
              Divider(color: Colors.grey[700], thickness: 1.5),
              Text(
                'Vergi No:',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '1050250859',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w200),
              ),
              Divider(color: Colors.grey[700], thickness: 1.5),
              Text(
                'Telefon:	',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '(0216) 331 48 00',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w200),
              ),
              Divider(color: Colors.grey[700], thickness: 1.5),
              Text(
                'E-Posta:',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'info@tobeto.com',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w200),
              ),
              Divider(color: Colors.grey[700], thickness: 1.5),
              Text(
                'Adres:',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Kavacık, Rüzgarlıbahçe Mah. Çampınarı Sok. No:4 Smart Plaza B Blok Kat:3 34805, Beykoz/İstanbul',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w200),
              ),
              Divider(color: Colors.grey[700], thickness: 1.5),
              Text(
                'İstanbul Kodluyor için Telefon:',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                '(0216) 969 22 40',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w200),
              ),
              Divider(color: Colors.grey[700], thickness: 1.5),
              Text(
                'İstanbul Kodluyor için E-Posta:',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'istanbulkodluyor@tobeto.com',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w200),
              ),
              Divider(color: Colors.grey[700], thickness: 1.5),
            ],
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ContactForm(),
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.5,
                  MediaQuery.of(context).size.height * 0.05,
                )),
            child: const Text("Bize Ulaşın"),
          ),
        ),
      ]),
    );
  }
}
