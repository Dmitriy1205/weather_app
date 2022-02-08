import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherClient {
  final Dio _dio = Dio();

  Future<Weather?> getCurrentWeather(double lat, double long) async {
    Weather? weather;
    try {
      Response response = await _dio.get(
          'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&exclude=hourly,daily&appid=f74b1847f8772c97edbb6f55db16e611&units=metric');
      // final body = jsonDecode(response.data);
      print(response.data);
      weather = Weather.fromJson(response.data);
    } on DioError catch (e) {
      print('DioError:$e');
    }
    return weather;

    //TODO on Exeption  if statusCode.......
  }
}
