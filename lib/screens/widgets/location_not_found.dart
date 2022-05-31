import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/constants/constants.dart';
import 'package:weather_app/business_logic/cubits/cubits.dart';

class LocationNotFound extends StatelessWidget {
  const LocationNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(flex: 2),
          Image.asset('assets/error/error.png',
              height: MediaQuery.of(context).size.height * 0.20),
          const SizedBox(height: 10.0),
          Text(
            'Place not found.',
            textAlign: TextAlign.center,
            style: textTheme.headline4!.copyWith(fontSize: 25.0),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: 200,
            child: OutlinedButton(
              onPressed: () =>
                  context.read<SearchWeatherCubit>().initializeResearch(),
              child: Text(
                'Try Again',
                style: textTheme.headline4!.copyWith(
                    color: kPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w200),
              ),
            ),
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
