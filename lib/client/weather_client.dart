import 'dart:convert';

import 'package:weather_app/model/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherClient {
  Future<Weather> getCurrentWeather(double lat, double long) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&exclude=hourly,daily&appid=f74b1847f8772c97edbb6f55db16e611&units=metric'));
    final body = jsonDecode(response.body);
    print(body);
    return Weather.fromJson(body);

    //TODO on Exeption  if statusCode.......
  }

}
