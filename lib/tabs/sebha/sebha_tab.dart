import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  double turns = 0.2;
  String tasbeh = 'سبحان الله';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Image.asset(
              'assets/images/head_sebha_logo.png',
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                SebhaNumber();
                counter++;
                setState(() {});
              },
              child: Transform.rotate(
                angle: turns,
                alignment: Alignment.topCenter,
                origin: Offset(180, 80),
                child: Image.asset(
                  'assets/images/body_sebha_logo.png',
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'عدد التسبيحات',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 30,
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
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppTheme.lightPrimary.withOpacity(0.6),
              ),
              height: 51,
              width: 137,
              child: Center(
                child: Text(
                  tasbeh,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            SizedBox(
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
      tasbeh = 'سبحان الله';
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
      tasbeh = 'سبحان الله';
      counter = 0;
    }
    setState(() {});
  }
}
