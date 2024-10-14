import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../settings/settings.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double turns = 0;
  String tasbeh = 'سبحان الله';

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
  return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.015,
                    child: Image.asset(
                      'assets/images/head_sebha_logo.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      SebhaNumber();
                      counter++;
                      setState(() {});
                    },
                    child: Transform.rotate(
                      angle: turns,
                      child: Image.asset(
                        'assets/images/body_sebha_logo.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              AppLocalizations.of(context)!.tasbeh,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppTheme.lightPrimary.withOpacity(0.6),
              ),
              height: 80,
              width: 70,
              child: Center(
                child: Text(
                  '$counter',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                SebhaNumber();
                counter++;
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppTheme.lightPrimary.withOpacity(0.6),
                ),
                height: 51,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Center(
                  child: Text(
                    tasbeh,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppTheme.lightPrimary.withOpacity(0.6),
              ),
              height: 51,
              width: 137,
              child: Center(
                  child: TextButton(
                onPressed: () {
                  counter = 0;
                  tasbeh = 'سبحان الله';
                  setState(() {});
                },
                child: Text(
                  'تصفير',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }

  void SebhaNumber() {
    if (counter == 33 && tasbeh == 'سبحان الله') {
      counter = 0;
      tasbeh = 'الحمدلله';
    }
    if (tasbeh == 'الحمدلله' && counter == 33) {
      tasbeh = 'الله اكبر ';
      counter = 0;
    }
    if (tasbeh == 'الله اكبر ' && counter == 33) {
      tasbeh = 'اللهم صلى على سيدنا محمد';
      counter = 0;
    }
    if (tasbeh == 'اللهم صلى على سيدنا محمد' && counter == 33) {
      tasbeh = 'سبحان الله ';
      counter = 33;
    }
    if (tasbeh == 'سبحان الله' && counter == 99) {
      tasbeh = 'الحمدلله';
      counter = 33;
    }
    if (tasbeh == 'الحمدلله' && counter == 99) {
      tasbeh = 'الله اكبر ';
      counter = 33;
    }
    if (tasbeh == 'الله اكبر ' && counter == 99) {
      tasbeh = 'اللهم صلى على سيدنا محمد';
      counter = 33;
    }
    if (tasbeh == 'اللهم صلى على سيدنا محمد' && counter == 99) {
      tasbeh = 'سبحان الله';
      counter = 0;
    }
    turns += 360 / 33 * pi;
    setState(() {});
  }
}
