import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  String language = 'en';

  Future<void> changeMode(ThemeMode selectedThemeMode) async {
    themeMode = selectedThemeMode;
    notifyListeners();
  }

  Future<void> changeLanguage(String lang) async {
    language = lang;
    notifyListeners();
  }
}
