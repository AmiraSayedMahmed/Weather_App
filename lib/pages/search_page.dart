import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key, this.cityName}) : super(key: key);
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5.5,
        title: const Text(
          'Search A City',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white70,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 6,
            ),
            const Text(
              'Hello love ',
              style: TextStyle(
                  color: Colors.brown,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              ' Please enter the name of city that you want ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            TextField(
              onSubmitted: (data) async {
                cityName = data;
                WeatherService service = WeatherService();
                WeatherModel weather =
                    await service.getWeather(cityName: cityName!);
                Provider.of<WeatherProvider>(context, listen: false)
                    .setWeatherData = weather;
                Provider.of<WeatherProvider>(context, listen: false).cityName =
                    cityName;
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                alignLabelWithHint: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                suffix: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    width: 2.0,
                    color: Colors.brown,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.brown,
                  ),
                ),
                hintText: 'Enter City',
                label: const Text('Search'),
              ),
            ),
            const Spacer(
              flex: 6,
            ),
          ],
        ),
      ),
    );
  }
}
