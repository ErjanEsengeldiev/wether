import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wether_bloc_home_work/data/entity/wether/wether.dart';
import 'package:wether_bloc_home_work/data/repository/wether_repository.dart';

part 'wether_bloc_event.dart';
part 'wether_bloc_state.dart';

class WetherBloc extends Bloc<WetherBlocEvent, WetherBlocState> {
  final WetherRepository repository;
  WetherBloc({required this.repository}) : super(WetherBlocInitialState()) {
    on<GetWetherOfCountryEvent>(
      (event, emit) async {
        emit(WetherLoadingState());
        try {
          emit(WetherLoadedState(
              weather: await WetherRepository()
                  .getWetherOfCountry(event.counterName)));
        } catch (eror) {
          emit(WetherErorState());
        }
      },
    );
  }
}
