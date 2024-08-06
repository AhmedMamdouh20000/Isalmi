import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/tabs/quran/sura_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTab extends StatelessWidget {
  List<String> suraNames = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/qur2an_screen_logo.png',
          height: MediaQuery.of(context).size.height * 0.24,
          width: 205,
        ),
        SizedBox(
          height: 13,
        ),
        Container(
          height: 3,
          decoration: BoxDecoration(
            color: AppTheme.lightPrimary,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Text(
          'اسماء الصور',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Container(
          height: 3,
          decoration: BoxDecoration(
            color: AppTheme.lightPrimary,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Expanded(
          child: ListView.separated(
            cacheExtent: 100,
            separatorBuilder: (_, index) => Container(
              height: 10,
            ),
            itemBuilder: (_, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    SuraDetailsScreen.routeName,
                    arguments: SuraDetailsArgs(
                      suraName: suraNames[index],
                      index: index,
                    ),
                  ),
                  child: Text(
                    suraNames[index],
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            itemCount: suraNames.length,
          ),
        ),
      ],
    );
  }
}

class SuraDetailsArgs {
  String suraName;
  int index;

  SuraDetailsArgs({required this.suraName, required this.index});
}
