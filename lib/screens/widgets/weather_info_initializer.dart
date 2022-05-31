import 'package:flutter/material.dart';
import 'package:weather_app/data/models/models.dart';
import 'package:weather_app/screens/widgets/widgets.dart';

class WeatherInfoInitializer extends StatefulWidget {
  const WeatherInfoInitializer(
      {Key? key,
      required this.locationSearched,
      required this.weatherForecastsList})
      : super(key: key);

  final String locationSearched;
  final Map<int, List<Weather>> weatherForecastsList;

  @override
  State<WeatherInfoInitializer> createState() => _WeatherInfoInitializerState();
}

class _WeatherInfoInitializerState extends State<WeatherInfoInitializer> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView.builder(
              itemCount: widget.weatherForecastsList.length,
              onPageChanged: (value) => setState(() => _currentPage = value),
              itemBuilder: ((context, index) => AllWeatherInfo(
                  currentPage: index,
                  isLastDay: index == widget.weatherForecastsList.length - 1
                      ? true
                      : false,
                  locationSearched: widget.locationSearched,
                  currentDayWeatherForecasts:
                      // every page view will contain the info weather about
                      // a particular day
                      widget.weatherForecastsList.values.elementAt(index)))),
        ),
        _ThreeDotsPageView(currentPage: _currentPage),
        const SizedBox(height: 17.5)
      ],
    );
  }
}

class _ThreeDotsPageView extends StatelessWidget {
  const _ThreeDotsPageView({Key? key, required this.currentPage})
      : super(key: key);

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        6,
        ((index) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 11.5),
              height: 6.0,
              width: index == currentPage ? 20.0 : 6.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3.0),
              ),
            )),
      ),
    );
  }
}
