import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '6dc2fb6a46e54d6ebf0200859233009';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      var response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'oops there is an error, try later';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there is an error, try again later');
    }
  }
}
