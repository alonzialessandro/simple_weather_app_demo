import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/data/models/weather.dart';
import 'package:weather_app/data/repositories/repositories.dart';

part 'search_weather_state.dart';

class SearchWeatherCubit extends Cubit<SearchWeatherState> {
  SearchWeatherCubit({required this.weatherRepository})
      : super(SearchWeatherInitial());

  final WeatherRepository weatherRepository;

  Future<void> fetchWeatherForecasts(String location) async {
    emit(SearchWeatherInProgress());

    try {
      // get list of daily forecasts from openweather API
      Map<int, List<Weather>> forecasts =
          await weatherRepository.getWeatherOfLocation(location);
      emit(SearchWeatherSuccess(
          weatherForecasts: forecasts, locationSearched: location));
    } catch (e) {
      debugPrint(e.toString());
      emit(const SearchWeatherFailure(errorMessage: 'Search error'));
    }
  }

  // allows to return to the initial form to search a new location
  void initializeResearch() => emit(SearchWeatherInitial());
}
