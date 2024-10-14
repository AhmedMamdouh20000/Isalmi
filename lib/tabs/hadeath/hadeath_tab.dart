import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/tabs/hadeath/hadeath.dart';
import 'package:islamic/tabs/hadeath/hadeath_details_screen.dart';

class HadeathTab extends StatefulWidget {
  const HadeathTab({super.key});

  @override
  State<HadeathTab> createState() => _HadeathTabState();
}

class _HadeathTabState extends State<HadeathTab> {
  List<Hadeath> ahadeath = [];
  @override
  Widget build(BuildContext context) {
    if (ahadeath.isEmpty) {
      loadAhadeathFile();
    }
    return Column(
      children: [
        Image.asset(
          'assets/images/hadeth_logo.png',
          height: MediaQuery.of(context).size.height * 0.24,
          width: 205,
        ),
        const SizedBox(
          height: 13,
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (_, index) => Container(
              height: 10,
            ),
            itemBuilder: (_, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    HadeathDetailsScreen.routeName,
                    arguments: ahadeath[index],
                  ),
                  child: Text(
                    ahadeath[index].title,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            itemCount: ahadeath.length,
          ),
        ),
      ],
    );
  }

  Future<void> loadAhadeathFile() async {
    String ahadeathFileContent =
        await rootBundle.loadString('assets/ahadeth.txt');
    List<String> ahadeathText = ahadeathFileContent.split('#');
    ahadeath = ahadeathText.map(
      (hadeathText) {
        List<String> hadeathLines = hadeathText.trim().split('\n');
        String title = hadeathLines[0];
        hadeathLines.removeAt(0);
        List<String> content = hadeathLines;
        return Hadeath(title: title, content: content);
      },
    ).toList();
    setState(() {});
  }
}
