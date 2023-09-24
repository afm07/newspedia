import 'package:flutter/material.dart';
import 'package:news_app/shared/themes/themes_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemesPreferences themesPreferences = ThemesPreferences();
  bool _darkTheme = false;

  bool get getDarkTheme => _darkTheme;

  set setDarkTheme(bool value){
    _darkTheme = value;
    themesPreferences.setDarkTheme(value);
    notifyListeners();
  }

}