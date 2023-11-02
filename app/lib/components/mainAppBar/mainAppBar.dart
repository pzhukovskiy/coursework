import 'package:app/components/navigationBlock/navigationBlock.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Главный экран'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                  themeNotifier.isDark ? Icons.wb_sunny : Icons.nights_stay),
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
          ],
        ),
        body: const Column(
          children: <Widget>[
            NavigationBlock(),
          ],
        ));
  }
}
