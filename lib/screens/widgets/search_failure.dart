import 'package:flutter/material.dart';

class SearchFailure extends StatelessWidget {
  const SearchFailure({Key? key}) : super(key: key);

  @override
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
            'Something went wrong.\nRestart the application.',
            textAlign: TextAlign.center,
            style: textTheme.headline4!.copyWith(fontSize: 25.0),
          ),
          const SizedBox(height: 20.0),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
