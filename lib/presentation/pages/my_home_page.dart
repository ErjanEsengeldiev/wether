import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_bloc_home_work/data/repository/wether_repository.dart';
import 'package:wether_bloc_home_work/presentation/bloc/wether_bloc_bloc.dart';
import 'package:wether_bloc_home_work/presentation/constants/my_colors.dart';
import 'package:wether_bloc_home_work/presentation/pages/widgets/serch_country_widget.dart';
import 'package:wether_bloc_home_work/presentation/pages/widgets/wether_info_widget.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final TextEditingController countryNameController = TextEditingController();
  final WetherRepository wetherRepository = WetherRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.sunnyColors,
      body: Center(
        child: BlocProvider(
          create: (context) => WetherBloc(repository: wetherRepository),
          child: BlocConsumer<WetherBloc, WetherBlocState>(
            listener: (context, state) {
              if (state is WetherErorState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Text('Такого города нет')],
                )));
              } else if (state is WetherLoadedState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(state.weather.name.toString())],
                )));
              }
            },
            builder: (context, state) {
              if (state is WetherBlocInitialState) {
                return SerchCountryWidget(
                    countryNameController: countryNameController);
              } else if (state is WetherLoadingState) {
                return const CircularProgressIndicator.adaptive();
              } else if (state is WetherLoadedState) {
                return WetherInfoWidget(
                  countryNameController: countryNameController,
                  state: state,
                );
              } else if (state is WetherErorState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SerchCountryWidget(
                      countryNameController: countryNameController,
                    ),
                  ],
                );
              } else {
                return const Text('Incorect State');
              }
            },
          ),
        ),
      ),
    );
  }
}
