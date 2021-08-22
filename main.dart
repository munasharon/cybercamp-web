import 'package:flutter/material.dart';
import 'package:uccybercampweatherapp/homepage.dart';

Future<void> main() async {
  runApp(WeatherHome());
}

class WeatherHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: " Muna's Weather App",
      home: HomePage(),
    );
  }
}
