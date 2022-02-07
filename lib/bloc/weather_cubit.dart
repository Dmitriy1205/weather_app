import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/client/weather_client.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInit());
  WeatherClient client = WeatherClient();

  Future<void> getWeather(double lat, double long) async {
    emit(WeatherLoading());
    WeatherClient client = WeatherClient();
    try {
      final result = await client.getCurrentWeather(lat, long);
      emit(WeatherLoaded(result));
    }
    catch (e) {}
    //TODO include all States
  }
}
