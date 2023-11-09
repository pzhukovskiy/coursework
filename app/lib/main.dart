import 'package:app/class/teacher.dart';
import 'package:app/components/aboutCollege/aboutCollege.dart';
import 'package:app/components/block/myBlock.dart';
import 'package:app/components/dropMenuLanguages/dropMenuLanguages.dart';
import 'package:app/components/bottomBar/bottomBar.dart';
import 'package:app/l10n/l10n.dart';
import 'package:app/pages/collegeNews/collegeNewsPage.dart';
import 'package:app/pages/listTeachers/listTeachers.dart';
import 'package:app/pages/settings/settings.dart';
import 'package:app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Teacher> teachers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      theme: themeNotifier.themeData,
      home: const BottomBar(),
      debugShowCheckedModeBanner: false,

      // * Локализация работает только если менять вручную
      supportedLocales: L10n.all,
      locale: const Locale('ru'),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: '/',
      routes: {
        '/settings': (context) => const SettingsPage(),
        '/list': (context) => const ListTeachersPage(),
        '/test': (context) => MyDropdown(),
        '/block': (context) => const MyBlock(),
        '/about': (context) => const AboutCollege(),
        '/news': (context) => const CollegeNewsPage(),
      }
    );
  }
}