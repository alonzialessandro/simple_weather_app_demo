import 'package:flutter/material.dart';
import 'package:weather_app/app/constants/constants.dart';
import 'package:weather_app/data/models/models.dart';

class HourlyForecastsList extends StatelessWidget {
  const HourlyForecastsList({Key? key, required this.currentDayForecasts})
      : super(key: key);

  final List<Weather> currentDayForecasts;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final formattedDate = dateFormat.format(currentDayForecasts.first.date);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formattedDate,
                textAlign: TextAlign.start,
                style: textTheme.headline4!
                    .copyWith(fontSize: 14.5, fontWeight: FontWeight.bold),
              ),
              Text(
                'Hourly forecasts',
                textAlign: TextAlign.start,
                style: textTheme.bodyText1!
                    .copyWith(fontSize: 14, color: kAccentColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15.0),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.33,
          child: ListView.builder(
            itemCount: currentDayForecasts.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _HourlyForecastTile(
              temp: currentDayForecasts[index].currentTemp,
              time: currentDayForecasts[index].date,
              weatherCode: currentDayForecasts[index].iconCode,
            ),
          ),
        ),
      ],
    );
  }
}

class _HourlyForecastTile extends StatelessWidget {
  const _HourlyForecastTile(
      {Key? key,
      required this.temp,
      required this.time,
      required this.weatherCode})
      : super(key: key);

  final double temp;
  final DateTime time;
  final String weatherCode;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(right: 15.0),
      padding: const EdgeInsets.only(top: 11.0),
      width: MediaQuery.of(context).size.width * 0.23,
      decoration: BoxDecoration(
          border: Border.all(color: kAccentColor, width: 1.5),
          borderRadius: BorderRadius.circular(20.0),
          color: kCardBackgroundColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '${Weather.fahrenheitToCelsius(temp).toStringAsFixed(0)}°',
            style: textTheme.headline4!
                .copyWith(fontSize: 19, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 7.0),
          Image.asset(Weather.getWeatherAssetsImages(weatherCode),
              height: 40, fit: BoxFit.cover),
          const SizedBox(height: 7.0),
          Text(
            time.hour.toStringAsFixed(2),
            style: textTheme.bodyText1!
                .copyWith(fontSize: 14, color: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
