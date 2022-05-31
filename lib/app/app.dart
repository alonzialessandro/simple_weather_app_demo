import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/constants/constants.dart';
import 'package:weather_app/business_logic/cubits/search_weather/search_weather_cubit.dart';
import 'package:weather_app/data/repositories/repositories.dart';
import 'package:weather_app/screens/screens.dart';

class AppInitializer extends StatelessWidget {
  const AppInitializer({Key? key, required WeatherRepository weatherRepository})
      : _weatherRepository = weatherRepository,
        super(key: key);

  final WeatherRepository _weatherRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: (context) => _weatherRepository,
      child: BlocProvider(
        create: (context) => SearchWeatherCubit(
          weatherRepository: _weatherRepository,
        ),
        child: const App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const HomeScreen());
  }
}
