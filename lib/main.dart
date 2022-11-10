import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Provider.of<WeatherProvider>(context).getWeatherData == null ? Colors.brown : Provider.of<WeatherProvider>(context).getWeatherData!.getTheme(),
      ),
      home:  HomePage(),
    );
  }
}