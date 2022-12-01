import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather.dart';

class WeatherProvider extends ChangeNotifier{

  WeatherModel? _weatherData ;
  String? cityName;

  set setWeatherData(WeatherModel value) {
    _weatherData = value;
    notifyListeners();
  }

  WeatherModel? get getWeatherData => _weatherData;
}