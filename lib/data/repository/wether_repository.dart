import 'package:wether_bloc_home_work/data/entity/wether/wether.dart';

import 'package:wether_bloc_home_work/domain/api_provider/wether_api_provider.dart';

class WetherRepository {
  Future<WetherEntity> getWetherOfCountry(String country) async {
    return await WetherApiProvider().getWetherOfCountry(country);
  }
}
