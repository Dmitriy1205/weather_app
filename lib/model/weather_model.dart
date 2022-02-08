class Weather {
  //TODO add other important fields
  double? lat;
  double? long;
  String? cityName;
  double? temp;
  int? wind;
  int? humidity;
  int? pressure;

  Weather(
      {required this.lat,
      required this.long,
      required this.cityName,
      required this.temp,
      required this.wind,
      required this.pressure,
      required this.humidity});

  Weather.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['lon'];
    cityName = json['timezone'];
    temp = json['current']['temp'];
    wind = json['current']['wind_speed'];
    humidity = json['current']['humidity'];
    pressure = json['current']['pressure'];
  }
}
