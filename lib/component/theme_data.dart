import 'package:flutter/material.dart';

import '../color.dart';

class DoryThemes {

  static ThemeData get lightTheme => ThemeData(
      fontFamily: "GmarketSans",
      primarySwatch: DoryColors.primaryMeterialColor,
      scaffoldBackgroundColor: Colors.black,
      splashColor: Colors.white,
      appBarTheme: _appbarTheme,
      brightness: Brightness.light
  );

  static ThemeData get darkTheme => ThemeData(
      fontFamily: "GmarketSans",
      primarySwatch: DoryColors.primaryMeterialColor,
      //scaffoldBackgroundColor: Colors.white,
      splashColor: Colors.white,
      brightness: Brightness.dark
  );
  static const AppBarTheme _appbarTheme = AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: DoryColors.primaryColor)
  );
}