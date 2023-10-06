import 'package:flutter/material.dart';

class Themes {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor:
                isDarkTheme ? const Color(0xFF121212) : const Color(0xFFFFFFFF),
            iconTheme: IconThemeData(
              color: isDarkTheme
                  ? const Color(0xFFE7E7E7)
                  : const Color(0xFF121212),
            )),
        scaffoldBackgroundColor:
            isDarkTheme ? const Color(0xFF121212) : const Color(0xFFFFFFFF),
        primaryColor: Colors.blueAccent,
        colorScheme: ThemeData().colorScheme.copyWith(
            brightness: isDarkTheme ? Brightness.dark : Brightness.light),
        cardColor:
            isDarkTheme ? const Color(0xFF0A0D2C) : const Color(0xFFF2FDFD),
        canvasColor:
            isDarkTheme ? const Color(0xFF121212) : const Color(0xFFE7E7E7));
  }
}
