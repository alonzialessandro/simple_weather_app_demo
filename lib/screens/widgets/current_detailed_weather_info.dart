import 'package:flutter/material.dart';
import 'package:weather_app/app/constants/constants.dart';

class CurrentDetailedInfoRow extends StatelessWidget {
  const CurrentDetailedInfoRow(
      {Key? key,
      required this.humidity,
      required this.pressure,
      required this.windSpeed,
      required this.cloudiness,
      required this.visibility,
      required this.precipitation})
      : super(key: key);

  final int humidity;
  final double pressure;
  final double windSpeed;
  final int cloudiness;
  final double visibility;
  final double precipitation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          // first information line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _InfoWidget(
                  infoLabel: 'Pressure hPa',
                  infoValue: pressure.toStringAsFixed(0)),
              _buildVerticalDivider(),
              _InfoWidget(
                  infoLabel: 'Humidity %', infoValue: humidity.toString()),
              _buildVerticalDivider(),
              _InfoWidget(
                  infoLabel: 'Wind m/s', infoValue: windSpeed.toString()),
            ],
          ),
          // second information line
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _InfoWidget(
                  infoLabel: 'Cloud %', infoValue: cloudiness.toString()),
              _buildVerticalDivider(),
              _InfoWidget(
                  infoLabel: 'Visibility Km', infoValue: visibility.toString()),
              _buildVerticalDivider(),
              _InfoWidget(
                  infoLabel: 'Precipit %', infoValue: precipitation.toString()),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox _buildVerticalDivider() {
    return const SizedBox(
      height: 53.0,
      child: VerticalDivider(
        width: 0,
        thickness: 0.8,
        indent: 18.0,
        color: kAccentColor,
      ),
    );
  }
}

class _InfoWidget extends StatelessWidget {
  const _InfoWidget(
      {Key? key, required this.infoLabel, required this.infoValue})
      : super(key: key);

  final String infoLabel;
  final String infoValue;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(infoLabel, style: textTheme.bodyText1),
          Text(infoValue, style: textTheme.headline4),
        ],
      ),
    );
  }
}
