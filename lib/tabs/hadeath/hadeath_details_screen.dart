import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/tabs/hadeath/hadeath.dart';
import 'package:islamic/tabs/settings/settings.dart';
import 'package:provider/provider.dart';

class HadeathDetailsScreen extends StatelessWidget {
  static const String routeName = 'hadeath-details';

  @override
  Widget build(BuildContext context) {
    Hadeath hadeath = ModalRoute.of(context)!.settings.arguments as Hadeath;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/default_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hadeath.title),
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1,
              horizontal: MediaQuery.of(context).size.width * 0.07),
          decoration: BoxDecoration(
            color: Provider.of<SettingsProvider>(context).themeMode ==
                    ThemeMode.light
                ? AppTheme.white
                : AppTheme.darkPrimary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: ListView.builder(
            itemBuilder: (_, index) => Text(
              hadeath.content[index],
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            itemCount: hadeath.content.length,
          ),
        ),
      ),
    );
  }
}
