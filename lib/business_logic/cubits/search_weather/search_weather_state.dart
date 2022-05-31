part of 'search_weather_cubit.dart';

abstract class SearchWeatherState extends Equatable {
  const SearchWeatherState();

  @override
  List<Object> get props => [];
}

class SearchWeatherInitial extends SearchWeatherState {}

class SearchWeatherInProgress extends SearchWeatherState {}

class SearchWeatherSuccess extends SearchWeatherState {
  const SearchWeatherSuccess({
    required this.weatherForecasts,
    required this.locationSearched
  });

  final Map<int, List<Weather>> weatherForecasts;
  final String locationSearched;

  @override
  List<Object> get props => [weatherForecasts, locationSearched];
}

class SearchWeatherFailure extends SearchWeatherState {
  const SearchWeatherFailure({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
