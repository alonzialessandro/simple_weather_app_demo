import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/app/constants/constants.dart';
import 'package:weather_app/business_logic/cubits/cubits.dart';
import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/screens/widgets/widgets.dart';

class AllWeatherInfo extends StatelessWidget {
  const AllWeatherInfo(
      {Key? key,
      required this.currentDayWeatherForecasts,
      required this.currentPage,
      required this.locationSearched,
      required this.isLastDay})
      : super(key: key);

  final List<Weather> currentDayWeatherForecasts;
  final int currentPage;
  final String locationSearched;
  final bool isLastDay;

  double _calcolateTempMin(List<Weather> weatherList) => weatherList
      .reduce((currentWeather, nextWeather) =>
          currentWeather.minTemp < nextWeather.minTemp
              ? currentWeather
              : nextWeather)
      .minTemp;

  double _calcolateTempMax(List<Weather> weatherList) => weatherList
      .reduce((currentWeather, nextWeather) =>
          currentWeather.maxTemp > nextWeather.maxTemp
              ? currentWeather
              : nextWeather)
      .maxTemp;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final formattedDate =
        dateFormat.format(currentDayWeatherForecasts.first.date);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 17.0),
      child: ListView(
        children: <Widget>[
          Text(
            formattedDate,
            textAlign: TextAlign.center,
            style: textTheme.bodyText1!.copyWith(fontSize: 15.5),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Text(
                  locationSearched.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyText1!.copyWith(
                    fontSize: 35.0,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(width: 5.0),
              IconButton(
                onPressed: () =>
                    context.read<SearchWeatherCubit>().initializeResearch(),
                icon: const FaIcon(FontAwesomeIcons.magnifyingGlassLocation,
                    color: kAccentColor, size: 29.0),
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          MainWeatherInfo(
            // if this is not the weather page which displays the current forecast,
            // choose to show for the other days the icon about the weather conditions
            // of midday
            weatherCode: currentPage == 0
                ? currentDayWeatherForecasts.first.iconCode
                : //currentDayWeatherForecasts[0].iconCode,
                // if this is not the last elementof the list (fix bug related
                // to the forecast of the last day available)
                !isLastDay
                    ? currentDayWeatherForecasts[4].iconCode
                    : currentDayWeatherForecasts[0].iconCode,
            weatherDescription: currentPage == 0
                ? currentDayWeatherForecasts.first.weatherDescription
                : !isLastDay
                    ? currentDayWeatherForecasts[4].weatherDescription
                    : currentDayWeatherForecasts[0].weatherDescription,

            currentTemp: Weather.fahrenheitToCelsius(
              currentPage == 0
                  ? currentDayWeatherForecasts.first.currentTemp
                  : !isLastDay
                      ? currentDayWeatherForecasts[4].currentTemp
                      : currentDayWeatherForecasts[0].currentTemp,
            ),
            maxTemp: Weather.fahrenheitToCelsius(
                _calcolateTempMax(currentDayWeatherForecasts)),
            minTemp: Weather.fahrenheitToCelsius(
                _calcolateTempMin(currentDayWeatherForecasts)),
            locationSearched: locationSearched,
          ),
          const SizedBox(height: 5.0),
          CurrentDetailedInfoRow(
            humidity: currentDayWeatherForecasts.first.humidity,
            pressure: currentDayWeatherForecasts.first.pressure,
            windSpeed: currentDayWeatherForecasts.first.windSpeed,
            cloudiness: currentDayWeatherForecasts.first.cloudiness,
            // conversion from m/s to km/s
            visibility: currentDayWeatherForecasts.first.visibility / 1000,
            precipitation: currentDayWeatherForecasts.first.precipitation,
          ),
          const SizedBox(height: 13.0),
          HourlyForecastsList(currentDayForecasts: currentDayWeatherForecasts),
        ],
      ),
    );
  }
}
