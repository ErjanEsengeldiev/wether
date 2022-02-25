part of 'wether_bloc_bloc.dart';

@immutable
abstract class WetherBlocState {}

class WetherBlocInitialState extends WetherBlocState {}

class WetherLoadedState extends WetherBlocState {
  final WetherEntity weather;

  WetherLoadedState({required this.weather});
}

class WetherLoadingState extends WetherBlocState {}

class WetherErorState extends WetherBlocState {}
