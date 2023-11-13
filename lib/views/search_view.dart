import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:quick_cast/models/weather_model/weather_dm.dart';
import 'package:quick_cast/services/weather_services/weather_services.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search city"),
      ),
      body: TextField(
        onSubmitted: (value) async{
          WeatherDM weatherModel = await WeatherService(Dio()).getCurrentWeather(cityName: value);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12
          ),
          labelText: 'Search',
          hintText: "Enter city Name",
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
      ),
    );
  }
}
