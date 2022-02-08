import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_cubit.dart';
import 'package:weather_app/bloc/weather_state.dart';

import '../model/weather_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  WeatherCubit data = WeatherCubit();

  @override
  void initState() {
    data.getWeather(50.4333, 30.5167);
    super.initState();
  }

  @override
  void dispose() {
    data.close();
    super.dispose();
  }

  //TODO geolocation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 1,
                  child: InkWell(
                    splashColor: Colors.grey, // splash color
                    child: Text('Day'),
                  ),
                ),
                const PopupMenuItem(
                  value: 0,
                  child: InkWell(
                    splashColor: Colors.grey, // splash color
                    child: Text('Hour'),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        bloc: data,
        builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WeatherLoaded) {
            return _buildWeatherPage(state.weather);
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildWeatherPage(Weather model) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            _weatherLocation('http://openweathermap.org/img/wn/01d@2x.png',
                '${model.temp?.round()}', '${model.cityName}'),
            const SizedBox(
              height: 80,
            ),
            //TODO ternar operator for choose byDay or byHour
          ],
        ),
      ),
    );
  }

  Widget _weatherLocation(String icon, String temp, String location) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 55,
            child: Image.network(
              icon,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            temp,
            style: const TextStyle(fontSize: 46),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            location,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.blueGrey,
            ),
          )
        ],
      ),
    );
  }

  Widget _weatherByDay(String wind, String pressure, String humidity) {
    return Container(
        //TODO Listview.builder with ExpansionTile to show weather by day
        );
  }

  Widget _weatherByHour(String wind, String pressure, String humidity) {
    return Container(
        //TODO Listview.builder with ExpansionTile to show weather by hour
        );
  }
}
