import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/app/constants/colors.dart';

ThemeData theme() => ThemeData(
    outlinedButtonTheme: outlinedButtonThemeData(),
    inputDecorationTheme: inputDecorationTheme(),
    scaffoldBackgroundColor: kPrimaryBackgroundColor,
    textTheme: textTheme());

OutlinedButtonThemeData outlinedButtonThemeData() {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
          vertical: 20.0 / 2.2, horizontal: 20.0 / 2.6),
      backgroundColor: kCardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(17),
      ),
      side: const BorderSide(color: kPrimaryColor, width: 1.5),
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    // top label behavior, in this case, label always on top
    floatingLabelBehavior: FloatingLabelBehavior.always,
    iconColor: Colors.white,
    contentPadding:
        const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0) +
            const EdgeInsets.only(top: 15.0),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17),
      borderSide: const BorderSide(color: kPrimaryColor, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17),
      borderSide: const BorderSide(color: kAccentColor, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(17),
        borderSide: const BorderSide(color: kErrorFocusedBorder, width: 1.5)),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(17),
      borderSide: const BorderSide(color: kErrorBorder, width: 1.5),
    ),
  );
}

TextTheme textTheme() {
  return TextTheme(
      headline1: GoogleFonts.poppins(
          fontSize: 65, color: kPrimaryColor, fontWeight: FontWeight.w200),
      headline4: GoogleFonts.poppins(
          fontSize: 35, color: kPrimaryColor, fontWeight: FontWeight.w300),
      bodyText1:
          GoogleFonts.poppins(fontSize: 14.5, color: kTextSecondaryColor),
      caption: GoogleFonts.poppins(fontSize: 16, color: kTextSecondaryColor),
      button: GoogleFonts.poppins(fontSize: 20, color: kPrimaryColor));
}
