import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic/tabs/hadeath/hadeath_tab.dart';
import 'package:islamic/tabs/quran/quran_tab.dart';
import 'package:islamic/tabs/radio/radio_tab.dart';
import 'package:islamic/tabs/sebha/sebha_tab.dart';
import 'package:islamic/tabs/settings/settings_tab.dart';

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
  ] ;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/default_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('إسلامي',
          ),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar:
        BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
              AssetImage('assets/images/icon_quran.png'),),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icon_hadeth.png'),),
              label: 'Hadeth',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icon_sebha.png'),),
              label: 'Sebha',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/icon_radio.png'),),
              label: 'Radio',
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.settings_outlined),
              label: 'Settings',
            ),

          ],
        ),
      ),
    );
  }
}
