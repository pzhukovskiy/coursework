import 'package:app/class/LanguageNotifier.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    // final languageNotifier = Provider.of<LanguageNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная страница'),
        actions: <Widget>[
          IconButton(
            icon:
                Icon(themeNotifier.isDark ? Icons.wb_sunny : Icons.nights_stay),
            tooltip: 'Сменить тему',
            onPressed: () {
              themeNotifier.toggleTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Перейти в настройки',
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              final languageNotifier =
                  Provider.of<LanguageNotifier>(context, listen: false);
              languageNotifier.toggleLanguage();
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.school),
            tooltip: 'Преподаватели',
            onPressed: () {
              Navigator.pushNamed(context, '/list');
            },
          ),
          IconButton(
            icon: const Icon(Icons.list),
            tooltip: 'Список тест',
            onPressed: () {
              Navigator.pushNamed(context, '/testList');
            },
          ),
          Text(AppLocalizations.of(context)!.appTitle)
        ],
      ),
    );
  }
}
