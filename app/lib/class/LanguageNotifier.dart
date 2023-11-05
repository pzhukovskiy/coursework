import 'package:flutter/material.dart';

class LanguageNotifier with ChangeNotifier {
  Locale _currentLocale = Locale('ru');

  Locale get currentLocale => _currentLocale;

  void toggleLanguage() {
    if (_currentLocale.languageCode == 'ru') {
      _currentLocale = Locale('en');
    } else {
      _currentLocale = Locale('ru');
    }
    notifyListeners();
  }
}
