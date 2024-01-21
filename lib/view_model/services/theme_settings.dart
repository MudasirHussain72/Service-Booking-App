import 'package:fyp/res/dark_theme.dart';
import 'package:fyp/res/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeMode = darkTheme;
  ThemeData get themeMode => _themeMode;
  bool _isDarkMode = true;
  bool get isDarkMode => _isDarkMode;

  ThemeChanger(bool isDark) {
    if (isDark) {
      _themeMode = darkTheme;
      _isDarkMode = true;
    } else {
      _themeMode = lightTheme;
      _isDarkMode = false;
    }
  }
  void setTheme(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_isDarkMode) {
      _themeMode = lightTheme;
      _isDarkMode = false;
      await prefs.setBool('isDark', false);
    } else {
      _themeMode = darkTheme;
      _isDarkMode = true;
      await prefs.setBool('isDark', true);
    }
    notifyListeners();
  }
}
