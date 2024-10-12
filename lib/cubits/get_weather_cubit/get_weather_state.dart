import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedSuccessfullyState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedSuccessfullyState(this.weatherModel);
}

class WeatherFailureState extends WeatherState {
  final String errMessage;

  WeatherFailureState({required this.errMessage});
}
