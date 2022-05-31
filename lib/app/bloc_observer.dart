import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class WeatherBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
     debugPrint(error.toString());
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint(change.toString());
  }
}
