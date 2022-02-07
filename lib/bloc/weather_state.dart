import 'package:equatable/equatable.dart';

import '../model/weather_model.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInit extends WeatherState {
  @override
  // TODO: implement props
  List<Object?> get props => [props];
}

class WeatherLoading extends WeatherState {
  @override
// TODO: implement props
  List<Object?> get props => [props];
}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  const WeatherLoaded(this.weather);

  @override
  List<Object?> get props => [weather];
}

class WeatherConnectionFailed extends WeatherState {
  final String message;

  const WeatherConnectionFailed(this.message);

  @override
  List<Object?> get props => [message];
}
