import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic/tabs/hadeath/hadeath_tab.dart';
import 'package:islamic/tabs/quran/quran_tab.dart';
import 'package:islamic/tabs/radio/radio_tab.dart';
import 'package:islamic/tabs/sebha/sebha_tab.dart';
import 'package:islamic/tabs/settings/settings.dart';
import 'package:islamic/tabs/settings/settings_tab.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScren extends StatefulWidget {
  static const String routeName = '/';

  @override
  State<HomeScren> createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadeathTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(settingsProvider.themeMode == ThemeMode.light
              ? 'assets/images/default_bg.png'
              : 'assets/images/dark_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.isalmi,
          ),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icon_quran.png'),
              ),
              label: AppLocalizations.of(context)!.quran,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icon_hadeth.png'),
              ),
              label: AppLocalizations.of(context)!.hadeath,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icon_sebha.png'),
              ),
              label: AppLocalizations.of(context)!.sebha,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icon_radio.png'),
              ),
              label: AppLocalizations.of(context)!.radio,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: AppLocalizations.of(context)!.settings,
            ),
          ],
        ),
      ),
    );
  }
}
