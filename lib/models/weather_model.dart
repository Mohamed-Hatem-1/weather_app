class WeatherModel {
  String city;
  DateTime date;
  String image;
  double temp;
  double maxTemp;
  double minTemp;
  String condition;

  WeatherModel({
    required this.city,
    required this.date,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      city: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
