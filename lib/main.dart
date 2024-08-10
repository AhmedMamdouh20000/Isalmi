import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/home_screen.dart';
import 'package:islamic/tabs/hadeath/hadeath_details_screen.dart';
import 'package:islamic/tabs/quran/sura_details_screen.dart';
import 'package:islamic/tabs/settings/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SettingsProvider(),
      child: IslamiApp(),
    ),
  );
}

class IslamiApp extends StatefulWidget {
  @override
  State<IslamiApp> createState() => _IslamiAppState();
}

class _IslamiAppState extends State<IslamiApp> {
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    initSharedPref(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScren.routeName: (_) => HomeScren(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HadeathDetailsScreen.routeName: (_) => HadeathDetailsScreen(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.themeMode,
      initialRoute: HomeScren.routeName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.language),
    );
  }
}


  Future <void> initSharedPref(context ) async {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var language = prefs.getString('language');
    if (language != null){
      settingsProvider.changeLanguage(language);
    }
    var isDark = prefs.getBool('isDark');
    if (isDark == true){
      settingsProvider.changeMode(ThemeMode.dark);
    }else if (isDark==false){
      settingsProvider.changeMode(ThemeMode.light);
    }
  }
