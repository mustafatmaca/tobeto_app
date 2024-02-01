import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Ad'),
            ),
            TextField(
              controller: _surnameController,
              decoration: InputDecoration(labelText: 'Soyad'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-posta'),
            ),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: 'Mesaj'),
              maxLines: 6,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Gönder'),
            ),
          ],
        ),
      ),
    );
  }
}
