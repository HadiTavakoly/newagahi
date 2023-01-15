import 'package:flutter/material.dart';
import '../constans.dart';

final themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  fontFamily: 'vazir',
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    floatingLabelStyle: TextStyle(
      color: primaryColor,
      fontSize: 25,
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xff595A5C),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: primaryColor,
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[50],
    elevation: 0.5,
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontFamily: 'vazir',
      fontSize: 18,
    ),
  ),
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: primaryColor,
  ),
  expansionTileTheme: ExpansionTileThemeData(
    iconColor: primaryColor,
  ),
);
