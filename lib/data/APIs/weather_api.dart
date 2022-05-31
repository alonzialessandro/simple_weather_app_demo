import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/api_key.dart';

class WeatherApi {
  Future<Map<String, dynamic>?> getRawWeather(
      {required String location}) async {
    final String url =
        'https://api.openweathermap.org/data/2.5/forecast?q=$location&appid=$openWeatherKey';
    
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      debugPrint('Http request completed correctly');
      return jsonDecode(response.body);
    } else {
      debugPrint('Http request failure');
      return null;
    }
  }
}
