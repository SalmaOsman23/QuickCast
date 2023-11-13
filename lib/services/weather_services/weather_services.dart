import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:quick_cast/models/weather_model/weather_dm.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "5d7874af22f64f94b8a31626230911";
  WeatherService(this.dio);


  Future<WeatherDM> getCurrentWeather({required String cityName}) async{
    try {
      Response response = await dio.get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=10");
      WeatherDM weatherModel = WeatherDM.fromJson(response.data);
      return weatherModel;
    } on DioException catch(e){
      final String errMessage = e.response?.data['error']['message'] ?? " opps There was an error, Try again later!";
      throw Exception(errMessage);
    } catch(e){ //if there was an error but not in the dio exception.
      log(e.toString()); //for the error to be noticable while debugging
      throw Exception("Try later!");
    }

  }
}
