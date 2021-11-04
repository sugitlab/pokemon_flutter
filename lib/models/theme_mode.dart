import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/theme_mode.dart';

class ThemeModeNotifier extends ChangeNotifier {
  late ThemeMode _themeMode;

  ThemeModeNotifier(SharedPreferences pref) {
    _init(pref);
  }

  ThemeMode get mode => _themeMode;

  void _init(SharedPreferences pref) async {
    _themeMode = await loadThemeMode(pref);
    notifyListeners();
  }

  void update(ThemeMode nextMode) {
    _themeMode = nextMode;
    saveThemeMode(nextMode);
    notifyListeners();
  }
}
