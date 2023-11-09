import 'package:app/pages/home/home.dart';
import 'package:app/pages/listTeachers/listTeachers.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBar();
}

class _BottomBar extends State<BottomBar> {
  int _selectedIndex = 0;
  late BuildContext context;
  String appBarTitle = 'Главная'; // * Нужно что-то с этим делать
  late List<Widget> _widgetOptions;
  late Locale currentLocale;
  late String currentLanguageCode;
  late String currentCountryCode;

  // * Локализация в AppBar не работает, поэтому без нее
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // * Неиспользуемые данные
      switch (index) {
        case 0:
          appBarTitle = 'Главная';
          break;
        case 1:
          appBarTitle = 'Расписание';
          break;
        case 2:
          appBarTitle = 'Структура';
          break;
        case 3:
          appBarTitle = 'Предложения';
          break;
        case 4:
          appBarTitle = 'Профиль';
          break;
        default:
          appBarTitle = 'Default Title';
      }
    });
  }

// * Делать экраны без AppBar, и тогда оно хорошо будет показываться
//! Чуток нужно изменить данные на бекенде

  @override
  Widget build(BuildContext context) {
    this.context = context;
    _widgetOptions = <Widget>[
      const Home(),
      const Text('2 страница'),
      const ListTeachersPage(),
      const Text('4 страница'),
      const Text('5 страница'),
    ];

    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My College'),
        actions: <Widget>[
          IconButton(
            icon:
                Icon(themeNotifier.isDark ? Icons.wb_sunny : Icons.nights_stay),
            tooltip: 'Сменить тему',
            onPressed: () {
              themeNotifier.toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: AppLocalizations.of(context)!.title, //* Главная
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.schedule),
            label: AppLocalizations.of(context)!.schedule, //* Расписание
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.info_outline_rounded),
            label: AppLocalizations.of(context)!.structure, //* Структура
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.business_center),
            label: AppLocalizations.of(context)!.offers, //* Предложения
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.perm_identity_rounded),
            label: AppLocalizations.of(context)!.profile, //* Профиль
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:
            Colors.blue, // * Активно
        unselectedItemColor:
            Colors.grey, // * Неактивно
        onTap: _onItemTapped,
      ),
    );
  }
}
