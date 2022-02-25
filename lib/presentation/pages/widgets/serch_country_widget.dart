import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wether_bloc_home_work/presentation/bloc/wether_bloc_bloc.dart';

class SerchCountryWidget extends StatelessWidget {
  const SerchCountryWidget({
    Key? key,
    required this.countryNameController,
  }) : super(key: key);

  final TextEditingController countryNameController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            textAlign: TextAlign.center,
            controller: countryNameController,
            decoration: const InputDecoration(hintText: 'Name Of Country'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: countryNameController.text.isEmpty
                      ? Colors.grey
                      : Colors.blue,
                  minimumSize: Size(MediaQuery.of(context).size.width, 60)),
              onPressed: () {
                if (countryNameController.text != '') {
                  context.read<WetherBloc>().add(GetWetherOfCountryEvent(
                      counterName: countryNameController.text));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text('Заполните поле')],
                  )));
                }
              },
              child: const Text('Serch'))
        ],
      ),
    );
  }
}
