import 'package:flutter/material.dart';

class WeatherModel {
   String date;
   double temp;
   double maxTemp;
   double minTemp;
   String stateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.stateName});

  factory WeatherModel.fromJson(dynamic data ){
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date :data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        stateName: jsonData['condition']['text']);
  }


  @override
  String toString() {
    // TODO: implement toString
    return 'temp = $temp , date = $date , minTem = $minTemp';
  }

  String getImage(){
    if (stateName == 'clear' || stateName =='light Cloud'){
      return 'assets/images/clear.png';
    } else if (stateName == 'Sleet' || stateName == 'snow' || stateName == 'Hail'){
      return 'assets/images/snow.png';
    }else if (stateName == 'Heavy Cloud'){
      return 'assets/images/cloudy.png';
    } else if (stateName == 'Light Rain' || stateName == 'Heavy Rain' || stateName == 'Showers' || stateName == 'Patchy rain possible'){
      return 'assets/images/rainy.png';
    } else if (stateName == 'Thunderstorm' || stateName == 'Thunder'){
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
    }
  MaterialColor getTheme(){
    if (stateName == 'clear' || stateName =='light Cloud'){
return Colors.blue;
    } else if (stateName == 'Sleet' || stateName == 'snow' || stateName == 'Hail'){
      return Colors.blue;
    }else if (stateName == 'Heavy Cloud'){
      return Colors.blueGrey;
    } else if (stateName == 'Light Rain' || stateName == 'Heavy Rain' || stateName == 'Showers' || stateName == 'Patchy rain possible'){
      return Colors.lightBlue;
    }
    else if (stateName == 'Sunny' ){
      return Colors.orange;
    }

    else if (stateName == 'Thunderstorm' || stateName == 'Thunder'){
      return Colors.yellow;
    } else {
      return Colors.blue;
    }

    }




































}
