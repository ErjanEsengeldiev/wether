import 'package:dio/dio.dart';
import 'package:wether_bloc_home_work/data/entity/wether/wether.dart';

class WetherApiProvider {
  Future<WetherEntity> getWetherOfCountry(String country) async {
    final response = await Dio().get(
        'https://api.openweathermap.org/data/2.5/weather?q=$country&appid=c2e5b00f38292e057c894d4b144789f6');
    if (response.statusCode == 200) {
      try {
        return WetherEntity.fromJson(response.data);
      } catch (eror) {
        throw Exception('Eror Convert To Wether');
      }
    } else {
      throw Exception('Eror Status Code:${response.statusCode}');
    }
  }
}
