import 'dart:convert';

import 'package:flutter_application_1/Models/weatherModel.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  String baseURL = 'http://api.weatherapi.com/v1';
  String apiKey = "e0811b37361d4a898d7161435230106";
  Future<weatherModel> getWeather({required String cityName}) async {
    Uri uri =
        Uri.parse('$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1');

    http.Response response = await http.get(uri);
    Map<String, dynamic> data = json.decode(response.body);
    weatherModel weathermodel = weatherModel.fromJson(data);
    return weathermodel;
  }
}
