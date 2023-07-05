import 'package:flutter/material.dart';

class ThemeUtil {
  static ThemeUtil? _instance;

  static ThemeUtil? getInstance() {
    _instance ??= ThemeUtil._internal();
    return _instance;
  }

  ThemeUtil._internal();

  ThemeData getTheme() {}

  ThemeData _getThemeData(Color color, String themeType) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: color,
      primaryColorDark: getDarkColor(color),
      primaryColorLight: getLightColor(color),
      appBarTheme: getAppBarTheme(color, Colors.white),
    );
  }

  Color getDarkColor(Color color) {
    int number = 20;
    int red = color.red - number <= 0 ? color.red : color.red - number;
    int green = color.green - number <= 0 ? color.green : color.green - number;
    int blue = color.blue - number <= 0 ? color.blue : color.blue - number;
    return Color.fromRGBO(red, green, blue, 1);
  }

  Color getLightColor(Color color) {
    int number = 20;
    int red = color.red + number >= 255 ? color.red : color.red - number;
    int green =
        color.green + number >= 255 ? color.green : color.green - number;
    int blue = color.blue + number >= 255 ? color.blue : color.blue - number;
    return Color.fromRGBO(red, green, blue, 1);
  }

  AppBarTheme getAppBarTheme(Color bgColor, Color iconColor) {
    return AppBarTheme(
      color: bgColor,
      elevation: 0.0,
      iconTheme: IconThemeData(color: iconColor),
      textTheme: TextTheme(
        titleLarge: TextStyle(color: iconColor, fontSize: 20),
      ),
    );
  }
}
