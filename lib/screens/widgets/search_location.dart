import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/constants/constants.dart';
import 'package:weather_app/business_logic/cubits/cubits.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  final TextEditingController placeFieldController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(flex: 3),
            Image.asset('assets/logo.png',
                height: MediaQuery.of(context).size.width * 0.31),
            Text('Simple weather app demo',
                textAlign: TextAlign.start,
                style: textTheme.headline4!
                    .copyWith(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 35.0),
            Form(
                key: formKey,
                child: _SearchFormField(
                    placeFieldController: placeFieldController)),
            const SizedBox(height: 25.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: OutlinedButton(
                onPressed: (() => formKey.currentState!.validate()
                    ? context
                        .read<SearchWeatherCubit>()
                        .fetchWeatherForecasts(placeFieldController.text)
                    : null),
                child: Text('Search',
                    style: textTheme.headline4!.copyWith(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w200)),
              ),
            ),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}

class _SearchFormField extends StatelessWidget {
  const _SearchFormField({Key? key, required this.placeFieldController})
      : super(key: key);

  final TextEditingController placeFieldController;

  String? _onPlaceFormValidation(String? place) =>
      placeFieldController.text != '' ? null : '* Empty Field';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: placeFieldController,
        validator: (place) => _onPlaceFormValidation(place),
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(color: kPrimaryColor, fontSize: 18),
        cursorColor: kPrimaryColor,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Enter a valid location',
          labelText: 'Search place',
          labelStyle: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(fontSize: 18.5, color: kPrimaryColor),
          errorStyle: Theme.of(context)
              .textTheme
              .caption!
              .copyWith(color: kErrorBorder, fontSize: 14),
          hintStyle:
              Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16.8),
          prefixIcon:
              const Icon(Icons.location_on, color: kAccentColor, size: 25.0),
        ),
      ),
    );
  }
}
