import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/constants/constants.dart';
import 'package:weather_app/business_logic/cubits/cubits.dart';
import 'package:weather_app/screens/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: BlocBuilder<SearchWeatherCubit, SearchWeatherState>(
        builder: (context, state) {
          if (state is SearchWeatherInitial) return const SearchLocation();

          if (state is SearchWeatherSuccess) {
            return state.weatherForecasts.isEmpty
                ? const LocationNotFound()
                : WeatherInfoInitializer(
                    locationSearched: state.locationSearched,
                    weatherForecastsList: state.weatherForecasts);
          }
          if (state is SearchWeatherFailure) return const SearchFailure();

          return const Center(
              child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
                color: kPrimaryColor, strokeWidth: 1.5),
          ));
        },
      ),
    ));
  }
}
