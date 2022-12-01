import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weeather/weather_cubit.dart';

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
                BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
                BlocProvider.of<WeatherCubit>(context).cityName = cityName;
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
                  borderSide: const BorderSide(
                    width: 2.0,
                    color: Colors.brown,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(
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
