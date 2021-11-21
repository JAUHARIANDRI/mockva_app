// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'colors.dart' as colors;

final ThemeData customTheme = ThemeData(
  //fontFamily: 'montserrat',
  primaryColor: colors.primaryColor,
  accentColor: colors.primaryColor,
  scaffoldBackgroundColor: colors.backgroundColor,
  appBarTheme: AppBarTheme(
      elevation: 0.5,
      textTheme: TextTheme(
        subtitle1: TextStyle(
          color: colors.primaryColor,
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      ),
      color: Colors.white,
      iconTheme: IconThemeData(
        color: colors.primaryColor,
      )),
  buttonTheme: ButtonThemeData(
      buttonColor: colors.primaryColor, disabledColor: colors.primaryColorDark),
);
