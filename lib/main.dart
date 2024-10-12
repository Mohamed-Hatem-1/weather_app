import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.condition),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) return Colors.blueGrey;
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.amber;

    case 'partly cloudy':
      return Colors.blueGrey;

    case 'cloudy':
    case 'overcast':
      return Colors.grey;

    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.indigo;

    case 'patchy rain possible':
    case 'light drizzle':
    case 'patchy light rain':
    case 'light rain':
    case 'moderate rain':
    case 'heavy rain':
    case 'thundery outbreaks possible':
    case 'rain with thunder':
    case 'torrential rain shower':
      return Colors.blue;

    case 'light snow':
    case 'patchy light snow':
    case 'moderate snow':
    case 'heavy snow':
    case 'blowing snow':
    case 'blizzard':
    case 'snow showers':
    case 'snow with thunder':
      return Colors.cyan;

    case 'patchy sleet possible':
    case 'light sleet':
    case 'moderate sleet':
    case 'heavy sleet':
    case 'sleet showers':
    case 'freezing drizzle':
    case 'light freezing rain':
    case 'heavy freezing rain':
      return Colors.lightBlue;

    case 'ice pellets':
    case 'showers of ice pellets':
      return Colors.purple;

    case 'thunder':
      return Colors.deepPurple;

    default:
      return Colors.blueGrey;
  }
}
