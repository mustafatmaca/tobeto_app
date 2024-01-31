import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/service_bloc/service_event.dart';
import 'package:tobeto_app/blocs/service_bloc/service_state.dart';
import 'package:tobeto_app/repository/urlLaunch_service.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  UrlLaunchService urlLaunchService;
  ServiceBloc({required this.urlLaunchService}) : super(ServiceInitial()) {
    on<SendMail>((event, emit) {
      urlLaunchService.sendMail();
    });

    on<SendMessage>((event, emit) {
      urlLaunchService.sendWpMessage();
    });
  }
}
