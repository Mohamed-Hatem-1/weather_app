import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class WeatherSearchPage extends StatelessWidget {
  const WeatherSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search a city",
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 10),
              border: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.orange,
                ),
              ),
              hintText: "Enter City Name",
              suffixIcon: Icon(Icons.search),
              labelText: "Search",
            ),
          ),
        ),
      ),
    );
  }
}
