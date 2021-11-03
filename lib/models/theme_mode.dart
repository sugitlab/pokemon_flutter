import 'package:flutter/material.dart';
import '../utils/theme_mode.dart';

class ThemeModeNotifier extends ChangeNotifier {
  ThemeMode? _themeMode;

  ThemeMode get mode {
    if (_themeMode == null) {
      _themeMode = defaultTheme;
      init();
    }
    return _themeMode!;
  }

  void init() async {
    _themeMode = await loadThemeMode();
    notifyListeners();
  }

  void update(ThemeMode nextMode) {
    _themeMode = nextMode;
    saveThemeMode(nextMode);
    notifyListeners();
  }
}
