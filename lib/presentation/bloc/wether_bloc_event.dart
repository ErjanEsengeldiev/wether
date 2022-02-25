part of 'wether_bloc_bloc.dart';

@immutable
abstract class WetherBlocEvent {}

class GetWetherOfCountryEvent extends WetherBlocEvent {
  final String counterName;

  GetWetherOfCountryEvent({required this.counterName});
}
