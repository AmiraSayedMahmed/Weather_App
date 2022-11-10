import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
   WeatherModel? weatherData = Provider.of<WeatherProvider>(context).getWeatherData;
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
      body: weatherData == null
          ? Center(
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
            )
          : Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
            weatherData.getTheme(),
            weatherData.getTheme()[200]!,
            weatherData.getTheme()[100]!,
           // weatherData.getTheme()[100]!,
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
                      Text('${Provider.of<WeatherProvider>(context).cityName}' , style: const TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),),

                      Text('Update date: ${weatherData.date.toString()}',
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
                      Image.asset(weatherData.getImage()),
                       Text('${weatherData.temp.toInt()}' , style: const TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),),
                       Column(
                         children:  [
                           Text('maxTemp : ${weatherData.maxTemp.toInt()}'),
                           Text('minTemp : ${weatherData.minTemp.toInt()}'),
                         ],
                       )
                    ],

                  ),
                  const Spacer(),
                   Text('${weatherData.stateName}', style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),),
                  const Spacer(flex: 5,),

                ],
              ),
            ),
    );
  }
}
