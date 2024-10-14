import 'package:flutter/material.dart';
import 'package:islamic/app_theme.dart';
import 'package:islamic/tabs/settings/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height*0.07,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.dark_mode,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Switch(
                value: settingsProvider.themeMode == ThemeMode.dark,
                onChanged: (value) => settingsProvider
                    .changeMode(value ? ThemeMode.dark : ThemeMode.light),
                activeColor: AppTheme.gold,
                inactiveTrackColor: Colors.grey,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  borderRadius: BorderRadius.circular(20),
                  value: settingsProvider.language,
                  items: [
                    DropdownMenuItem<String>(
                      value: 'en',
                      child: Text(
                        'English',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'ar',
                      child: Text(
                        'العربية',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ],
                  onChanged: (selectedValue) {
                    if (selectedValue == null) return;
                    settingsProvider.changeLanguage(selectedValue);
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
