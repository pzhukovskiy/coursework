import 'package:app/class/game.dart';
import 'package:app/class/teacher.dart';
import 'package:app/components/mainAppBar/mainAppBar.dart';
import 'package:app/pages/listTeachers/listTeachers.dart';
import 'package:app/pages/settings/settings.dart';
import 'package:app/theme/theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
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
  List<Game> games = [];
  List<Teacher> teachers = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> fetchGame() async {
    final response = await http.get(
      Uri.parse('https://api.dionisiubrovka.online/api/v1/games/'),
      headers: {
        'Authorization': 'Token 6b5c8514238ae3a1a840b1b0300b4181093e682d',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      setState(() {
        games = data.map((item) => Game.fromJson(item)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      theme: themeNotifier.themeData,
      home: const MainAppBar(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/settings': (context) => const SettingsPage(),
        '/list': (context) => ListTeachersPage(),
        },
    );
  }
}
