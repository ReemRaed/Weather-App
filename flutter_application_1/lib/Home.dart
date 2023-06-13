import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/weatherModel.dart';
import 'package:flutter_application_1/Providers/weatherProvider.dart';
import 'package:flutter_application_1/Services/WeatherService.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    String? cityName;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(8),
          child: TextField(
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();
              weatherModel weathermodel =
                  await service.getWeather(cityName: cityName!);

              Provider.of<weatherProvider>(context, listen: false).WeatherData =
                  weathermodel;
              Navigator.pop(context);
              // print(weathermodel);
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 16),
                hintText: "Enter Your City",
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 3, color: Colors.deepOrange),
                    borderRadius: BorderRadius.circular(9)),
                prefixIcon: const Icon(Icons.search),
                label: Text('Search')),
          ),
        ),
      ),
    );
  }
}
