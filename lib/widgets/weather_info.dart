import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/get_weather_cubit/get_weather_cubit.dart';
import '../main.dart';
import '../models/weather_model.dart';

class WeatherInfo extends StatelessWidget {
  final WeatherModel weather;

  const WeatherInfo({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.condition),
            getThemeColor(weatherModel.condition)[300]!,
            getThemeColor(weatherModel.condition)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.city,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                "updated at ${weatherModel.date.hour}:${weatherModel.date.minute}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network('https:${weatherModel.image}'),
                  Text(
                    weatherModel.temp.toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text("Maxtemp: ${weatherModel.maxTemp}"),
                      Text("Mintemp: ${weatherModel.minTemp}"),
                    ],
                  )
                ],
              ),
              Text(
                weatherModel.condition,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
