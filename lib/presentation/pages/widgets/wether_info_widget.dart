import 'package:flutter/material.dart';
import 'package:wether_bloc_home_work/presentation/bloc/wether_bloc_bloc.dart';
import 'package:wether_bloc_home_work/presentation/constants/convert_week_day.dart';
import 'package:wether_bloc_home_work/presentation/pages/widgets/serch_country_widget.dart';

class WetherInfoWidget extends StatelessWidget {
  const WetherInfoWidget({
    Key? key,
    required this.countryNameController,
    required this.state,
  }) : super(key: key);

  final WetherLoadedState state;
  final TextEditingController countryNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            'Date: ${DateTime.now().year}.${DateTime.now().month}.${DateTime.now().day}'),
        const SizedBox(height: 20),
        Text(ConvertWeek.convertWeekDay(DateTime.now().weekday)),
        const SizedBox(height: 20),
        Text('${DateTime.now().hour}:${DateTime.now().minute}'),
        const SizedBox(height: 20),
        Icon(
          (state.weather.main!.temp! - 273).round() > 15
              ? Icons.wb_sunny
              : Icons.wb_cloudy,
          size: 100,
        ),
        const SizedBox(height: 20),
        Text('${state.weather.name}'),
        const SizedBox(height: 20),
        Text('${(state.weather.main!.tempMin! - 273).round()}*C - ${(state.weather.main!.tempMax! - 273).round()}*C'),
        SerchCountryWidget(
          countryNameController: countryNameController,
        ),
      ],
    );
  }
}
