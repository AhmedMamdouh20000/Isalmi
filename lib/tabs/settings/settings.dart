import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  String language = 'en';

  Future<void> changeMode(ThemeMode selectedThemeMode) async {
    themeMode = selectedThemeMode;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', themeMode ==ThemeMode.dark ) ;

  }

  Future<void> changeLanguage(String lang) async {
    language = lang;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', language);
  }
}
