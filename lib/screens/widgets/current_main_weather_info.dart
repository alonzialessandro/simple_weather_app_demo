import 'package:flutter/material.dart';
import 'package:weather_app/app/constants/colors.dart';
import 'package:weather_app/data/models/models.dart';

class MainWeatherInfo extends StatelessWidget {
  const MainWeatherInfo(
      {Key? key,
      required this.weatherDescription,
      required this.currentTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherCode,
      required this.locationSearched})
      : super(key: key);

  final String weatherDescription;
  final double currentTemp;
  final double maxTemp;
  final double minTemp;
  final String weatherCode;
  final String locationSearched;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(Weather.getWeatherAssetsImages(weatherCode),
              height: 145, fit: BoxFit.cover),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                currentTemp.toStringAsFixed(0),
                style: textTheme.headline1!
                    .copyWith(fontSize: 75, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 3),
              Padding(
                padding: const EdgeInsets.only(bottom: 28.0),
                child: Text(
                  '°C',
                  style: textTheme.bodyText1!
                      .copyWith(fontSize: 40.0, color: kAccentColor),
                ),
              ),
              const SizedBox(width: 10.0),
              Text(
                '/',
                style: textTheme.bodyText1!
                    .copyWith(fontSize: 40.0, color: Colors.grey.shade600),
              ),
              const SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'Max: ${maxTemp.round()} ',
                      style: textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          color: kTextSecondaryColor,
                          letterSpacing: 1.5),
                      children: [
                        TextSpan(
                            text: '°C',
                            style: textTheme.bodyText1!
                                .copyWith(fontSize: 16, color: kAccentColor))
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Min: ${minTemp.round()} ',
                      style: textTheme.bodyText1!.copyWith(
                          fontSize: 16,
                          color: kTextSecondaryColor,
                          letterSpacing: 1.5),
                      children: [
                        TextSpan(
                            text: '°C',
                            style: textTheme.bodyText1!
                                .copyWith(fontSize: 16, color: kAccentColor))
                      ],
                    ),
                  ),
                  const SizedBox(height: 3.0),
                ],
              ),
            ],
          ),
          Text(
            weatherDescription.toUpperCase(),
            style: textTheme.bodyText1!.copyWith(
              fontSize: 19,
              letterSpacing: 2,
              color: kPrimaryColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
