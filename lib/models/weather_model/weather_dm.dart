class WeatherDM{
  final String cityName;
  final String date;
  final String? image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String condition;

  WeatherDM(
      {required this.cityName,
        required this.date,
        this.image,
        required this.temp,
        required this.maxTemp,
        required this.minTemp,
        required this.condition});

  factory WeatherDM.fromJson(json){
    return WeatherDM(cityName: json['location']['name'],
        date: json['current']['last_updated'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        condition: json['forecast']['forecastday'][0]['day']['condition']['text']);
  }
}