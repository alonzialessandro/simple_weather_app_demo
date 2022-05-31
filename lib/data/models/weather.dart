import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  const Weather(
      {required this.currentTemp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherDescription,
      required this.iconCode,
      required this.date,
      required this.humidity,
      required this.pressure,
      required this.windSpeed,
      required this.cloudiness,
      required this.visibility,
      required this.precipitation});

  final double currentTemp;
  final double minTemp;
  final double maxTemp;
  final String weatherDescription;
  // allows to chose the correct image of the current weather condition
  final String iconCode;
  // weekday, Month Day (number) 
  final DateTime date;
  // %
  final int humidity;
  // hPa
  final double pressure;
  // m/s
  final double windSpeed;
  // %
  final int cloudiness;
  // m
  final double visibility;
  // %
  final double precipitation;

  factory Weather.fromJson(Map<String, dynamic> json) {
    // allows to convert the sublist with some weather informations
    final weatherInfoSublist = (json['weather'] as List).elementAt(0);
    return Weather(
      currentTemp: (json['main']['temp'] as num).toDouble(),
      minTemp: (json['main']['temp_min'] as num).toDouble(),
      maxTemp: (json['main']['temp_max'] as num).toDouble(),
      weatherDescription: weatherInfoSublist['description'],
      iconCode: weatherInfoSublist['icon'],
      date: DateTime.parse(json['dt_txt'] as String),
      humidity: (json['main']['humidity'] as num).toInt(),
      pressure: (json['main']['pressure'] as num).toDouble(),
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      cloudiness: (json['clouds']['all'] as num).toInt(),
      visibility: (json['visibility'] as num).toDouble(),
      precipitation: (json['pop'] as num).toDouble(),
    );
  }

  static double fahrenheitToCelsius(double fahrenheitValue) =>
      fahrenheitValue - 272.5;

  static String getWeatherAssetsImages(String weatherCode) {
    switch (weatherCode) {
      // day
      case '01d':
        // only sun
        return 'assets/day/7.png';
      case '02d':
        // sun + cloud
        return 'assets/day/21.png';
      case '03d':
        // only cloud
        return 'assets/both/22.png';
      case '04d':
        // only cloud
        return 'assets/both/22.png';
      case '09d':
        // cloud + rain + wind
        return 'assets/both/5.png';
      case '10d':
        // cloud + rain + cloud + wind
        return 'assets/day/13.png';
      case '11d':
        // cloud + thunderstorm
        return 'assets/day/17.png';
      case '13d':
        // snow
        return 'assets/both/18.png';
      case '50d':
        // sun + wind
        return 'assets/day/6.png';
      // night
      case '01n':
        // only moon
        return 'assets/night/10.png';
      case '02n':
        // moon + cloud
        return 'assets/night/19.png';
      case '03n':
        // only cloud
        return 'assets/both/22.png';
      case '04n':
        // only cloud
        return 'assets/both/22.png';
      case '09n':
        // cloud + rain + wind
        return 'assets/both/5.png';
      case '10n':
        // moon + cloud + rain
        return 'assets/night/1.png';
      case '11n':
        // moon + thunderstorm
        return 'assets/night/20.png';
      case '13n':
        // snow
        return 'assets/both/18.png';
      case '50n':
        // moon + cloud + rain
        return 'assets/night/1.png';
      default:
        // moon + cloud + rain
        return 'assets/night/1.png';
    }
  }

  @override
  List<Object> get props => [
        currentTemp,
        minTemp,
        maxTemp,
        weatherDescription,
        iconCode,
        date,
        humidity,
        pressure,
        windSpeed,
        cloudiness,
        visibility,
        precipitation
      ];
}
