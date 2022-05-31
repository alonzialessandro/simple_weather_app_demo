import 'package:collection/collection.dart';
import 'package:weather_app/data/APIs/weather_api.dart';
import 'package:weather_app/data/models/weather.dart';

class WeatherRepository {
  final WeatherApi _weatherApi = WeatherApi();

  Future<Map<int, List<Weather>>> getWeatherOfLocation(String location) async {
    final json = await _weatherApi.getRawWeather(location: location);

    if (json != null) {
      // convert map to a list of weather objects
      final List<Weather> list = (json['list'] as List)
          .map((dailyWeatherInfo) => Weather.fromJson(dailyWeatherInfo))
          .toList();

      // group objects by date
      return _groupEmployeesByCountry(list);
    } else
      return {};
  }

  // allows to group the forecasts according to the day to which they refer
  Map<int, List<Weather>> _groupEmployeesByCountry(List<Weather> forecasts) =>
      groupBy(forecasts, (Weather singleForecast) => singleForecast.date.day);
}
