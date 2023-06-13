import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/weatherModel.dart';

class weatherProvider extends ChangeNotifier {
  weatherModel? _WeatherData;

  set WeatherData(weatherModel weather) {
    WeatherData = weather;
    notifyListeners();
  }

  weatherModel get WeatherData => _WeatherData!;
}
