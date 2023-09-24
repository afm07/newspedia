import 'package:shared_preferences/shared_preferences.dart';

class ThemesPreferences {

  static const themeType = "themeType";

  setDarkTheme(bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(themeType, value);
  }

  Future<bool> getTheme() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(themeType)  ?? false;
  }
}