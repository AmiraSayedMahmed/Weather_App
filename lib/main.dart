import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weeather/weather_cubit.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

void main() {
  runApp(
     BlocProvider(
         create: (context) => WeatherCubit(WeatherService()),
         child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primaryColor: BlocProvider.of<WeatherCubit>(context).model == null ? Colors.brown : BlocProvider.of<WeatherCubit>(context).model!.getTheme(),
      ),
      home:  HomePage(),
    );
  }
}