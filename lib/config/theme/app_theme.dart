import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  useMaterial3: true,
  primaryColor: appPrimaryColor,
  indicatorColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: appPrimaryColor,
    titleTextStyle: TextStyle(
      fontSize: 21,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    foregroundColor: Colors.white,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.black.withOpacity(0),
  ),
);

const appPrimaryColor = Color.fromARGB(255, 16, 119, 107);
