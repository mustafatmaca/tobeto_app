// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class ServiceEvent {}

class SendMail extends ServiceEvent {}

class SendMessage extends ServiceEvent {}

class LaunchSocialUrl extends ServiceEvent {
  String url;
  LaunchSocialUrl({
    required this.url,
  });
}
