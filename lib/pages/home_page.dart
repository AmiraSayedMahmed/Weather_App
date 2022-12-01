import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weeather/weather_cubit.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
   WeatherModel? weatherData ;
    return Scaffold(
      appBar: AppBar(
        elevation: 5.5,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchPage()));
              },
              icon: const Icon(Icons.search))
        ],
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit , WeatherState>(
        builder: (context,state){
          if(state is WeatherLoadingState){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if (state is WeatherSuccessState) {
            weatherData = BlocProvider.of<WeatherCubit>(context).model;
            return SuccessWidget(weatherData: weatherData);
          }
          else if (state is WeatherFailState){
            return const Text('Something went wrong please try again ');
          }
          else {
            return Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white70,

                ),
                child: const Text(
                  'There is no weather 😔 \n Start searching now 🔍',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            );
          }
  }
  ),

    );
  }
}

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          gradient: LinearGradient(
              colors: [
                weatherData!.getTheme(),
                weatherData!.getTheme()[200]!,
                weatherData!.getTheme()[100]!,
                weatherData!.getTheme()[100]!,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter

          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3,),
          Column(
            children:  [
              Text('${BlocProvider.of<WeatherCubit>(context).cityName}' ,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),),

              Text('Update date: ${weatherData!.date.toString()}',
                style: const TextStyle(
                  fontSize: 22,
                ),
              )
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData!.getImage()),
              Text('${weatherData!.temp.toInt()}',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),),
              Column(
                children: [
                  Text('maxTemp : ${weatherData!.maxTemp.toInt()}'),
                  Text('minTemp : ${weatherData!.minTemp.toInt()}'),
                ],
              )
            ],

          ),
          const Spacer(),
          Text('${weatherData?.weatherStateName}', style: const TextStyle(
            color: Colors.black,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),),
          const Spacer(flex: 5,),

        ],
      ),
    );
  }
}
