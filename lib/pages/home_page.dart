import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/pages/weather_search_page.dart';

import '../cubits/get_weather_cubit/get_weather_state.dart';
import '../main.dart';
import '../widgets/no_weather_widget.dart';
import '../widgets/weather_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
          return AppBar(
            elevation: 5,
            shadowColor: Colors.black,
            title: const Text(
              "Weather App",
            ),
            foregroundColor: Colors.white,
            backgroundColor: getThemeColor(
                BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel
                    ?.condition),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WeatherSearchPage(),
                      ));
                },
                icon: const Icon(Icons.search),
                color: Colors.white,
              )
            ],
          );
        }),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherWidget();
          } else if (state is WeatherLoadedSuccessfullyState) {
            return WeatherInfo(
              weather: state.weatherModel,
            );
          } else {
            return const Center(
              child: Text("Something went wrong, please try again"),
            );
          }
        },
      ),
    );
  }
}
