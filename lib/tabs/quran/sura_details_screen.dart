import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/tabs/quran/quran_tab.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = '/sura-details';

  @override
  Widget build(BuildContext context) {
    List<String> ayat = [
      ' بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ ',
      ' الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ',
      ' الرَّحْمَنِ الرَّحِيمِ',
      ' مَالِكِ يَوْمِ الدِّينِ',
      ' إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ',
      ' اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ',
      ' صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّين',
    ];
    SuraDetailsArgs args =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/default_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.suraName),
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1,
              horizontal: MediaQuery.of(context).size.width * 0.07),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ListView.builder(
            itemBuilder: (_, index) => Text(
              ayat[index],
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            itemCount: ayat.length,
          ),
        ),
      ),
    );
  }
}
