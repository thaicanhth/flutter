import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:project_flutter2/models/weather_model.dart';
class WeatherApiClient{
  Future<Weather>? getCurrentWeather(String? location) async{
    var endpoint = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$location&appid=7d70bd4ba59964ffee9857474b271cce&units=metric");
    var resposne = await http.get(endpoint);
    var body =jsonDecode(resposne.body);
    print(Weather.fromJsion(body).cityName);
    return Weather.fromJsion(body);
  }
}