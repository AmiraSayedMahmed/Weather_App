part of 'weather_cubit.dart';


abstract class WeatherState {}

class WeatherInitial extends WeatherState {}
class WeatherLoadingState extends WeatherState {}
class WeatherSuccessState extends WeatherState {}
class WeatherFailState extends WeatherState {}
