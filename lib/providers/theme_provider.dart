import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool('darkMode') ?? false;
    bool isNight = prefs.getBool('nightMode') ?? false;

    if (isNight) {
      _themeMode = ThemeMode.system; // We'll use custom Night mode
    } else if (isDark) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }

    notifyListeners();
  }

  void updateTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
