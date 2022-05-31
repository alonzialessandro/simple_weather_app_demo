import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/bloc_observer.dart';
import 'package:weather_app/data/repositories/repositories.dart';
import 'app/app.dart';

void main() {
  BlocOverrides.runZoned(
      () => runApp(AppInitializer(weatherRepository: WeatherRepository())),
      blocObserver: WeatherBlocObserver());
}
