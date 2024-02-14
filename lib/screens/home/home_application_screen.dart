import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/application_bloc/application_bloc.dart';
import 'package:tobeto_app/blocs/application_bloc/application_event.dart';
import 'package:tobeto_app/blocs/application_bloc/application_state.dart';
import 'package:tobeto_app/widgets/home_widgets/applications_card.dart';
import 'package:tobeto_app/widgets/home_widgets/empty_card.dart';

class HomeApplicationScreen extends StatefulWidget {
  const HomeApplicationScreen({Key? key}) : super(key: key);

  @override
  _HomeApplicationScreenState createState() => _HomeApplicationScreenState();
}

class _HomeApplicationScreenState extends State<HomeApplicationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child:
          NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            snap: true,
            floating: true,
            scrolledUnderElevation: 0.0,
            title: const Text("Başvurularım"),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios)),
          )
        ];
      }, body: BlocBuilder<ApplicationBloc, ApplicationState>(
        builder: (context, state) {
          if (state is ApplicationInitial) {
            context.read<ApplicationBloc>().add(LoadApplication());
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ApplicationLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ApplicationLoaded) {
            if (state.applicationList.isEmpty) {
              return const EmptyCard();
            } else {
              return ListView.builder(
                itemCount: state.applicationList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.03),
                    child: ApplicationsCard(
                      title: state.applicationList[index].title,
                      subtitle: state.applicationList[index].subtitle,
                      subtitle2: state.applicationList[index].subtitle1,
                      state: state.applicationList[index].state,
                    ),
                  );
                },
              );
            }
          } else if (state is ApplicationError) {
            return const Center(
              child: Text("That's an error."),
            );
          } else {
            return const Center(
              child: Text("Something went wrong."),
            );
          }
        },
      )),
    ));
  }
}
