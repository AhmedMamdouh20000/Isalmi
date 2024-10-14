import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/tabs/quran/quran_tab.dart';
import 'package:islamic/tabs/settings/settings.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = '/sura-details';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];
  late SuraDetailsArgs args;
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    if (ayat.isEmpty) {
      loadSuraFile();
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(settingsProvider.themeMode == ThemeMode.light
              ? 'assets/images/default_bg.png'
              : 'assets/images/dark_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                '(عدد الايات ${ayat.length})',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Container(
                width: 10,
              ),
              Text('سورة ${args.suraName}'),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(24),
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
          child: ayat.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemBuilder: (_, index) => Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/images/arabic_art.png",
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.1,
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.04,
                            child: Text(
                              textAlign: TextAlign.center,
                              "${index + 1}".toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontSize: 17,
                                color: settingsProvider.themeMode == ThemeMode.light ? AppTheme.darkPrimary:AppTheme.lightPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Text(
                          ayat[index],
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  itemCount: ayat.length,
                ),
        ),
      ),
    );
  }

  Future<void> loadSuraFile() async {
    String sura =
        await rootBundle.loadString('assets/SuraFile/${args.index + 1}.txt');
    ayat = sura.split('\r\n');
    setState(() {});
  }
}
