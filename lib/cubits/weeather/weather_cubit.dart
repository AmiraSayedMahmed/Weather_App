import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_services.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
  WeatherModel? model;
  String? cityName;

  void getWeather ({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      model = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccessState());
    } on Exception catch (e) {
      emit(WeatherFailState());
    }

  }
}
