import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  WeatherModel? weatherModel;

  GetWeatherCubit() : super(WeatherInitialState());

  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(
        WeatherLoadedSuccessfullyState(weatherModel!),
      );
    } catch (e) {
      emit(
        WeatherFailureState(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
