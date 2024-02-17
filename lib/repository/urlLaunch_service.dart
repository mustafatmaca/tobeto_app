import 'package:url_launcher/url_launcher.dart';

class UrlLaunchService {
  void sendMail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'tobetoproje@gmail.com',
      query: 'subject=Geri Bildirim', //add subject and body here
    );

    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else {
      throw 'Could not launch $params';
    }
  }

  void sendWpMessage() async {
    const uri = 'https://wa.me/';

    if (await canLaunchUrl(Uri.tryParse(uri)!)) {
      await launchUrl(Uri.tryParse(uri)!);
    } else {
      throw 'Could not launch $uri';
    }
  }

  void launchSocialUrl(String socialUrl) async {
    var uri = socialUrl;

    if (await canLaunchUrl(Uri.tryParse(uri)!)) {
      await launchUrl(Uri.tryParse(uri)!);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
