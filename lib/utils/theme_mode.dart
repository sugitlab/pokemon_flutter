import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --[ざっくりコード編]--
// int modeToVal(ThemeMode mode) {
//   switch (mode) {
//     case ThemeMode.system:
//       return 1;
//     case ThemeMode.dark:
//       return 2;
//     case ThemeMode.light:
//       return 3;
//     default:
//       return 0;
//   }
// }
//
// ThemeMode valToMode(int val) {
//   switch (val) {
//     case 1:
//       return ThemeMode.system;
//     case 2:
//       return ThemeMode.dark;
//     case 3:
//       return ThemeMode.light;
//     default:
//       return ThemeMode.system;
//   }
// }
//
// Future<void> saveThemeMode(ThemeMode mode) async {
//   final pref = await SharedPreferences.getInstance();
//   pref.setInt('theme_mode', modeToVal(mode));
// }
//
// Future<ThemeMode> loadThemeMode() async {
//   final pref = await SharedPreferences.getInstance();
//   final ret = valToMode(pref.getInt('theme_mode') ?? 0);
//   return ret;
// }

const defaultTheme = ThemeMode.system;

Future<void> saveThemeMode(ThemeMode mode) async {
  final pref = await SharedPreferences.getInstance();
  pref.setString(mode.key, mode.name);
}

Future<ThemeMode> loadThemeMode() async {
  final pref = await SharedPreferences.getInstance();
  return toMode(pref.getString(defaultTheme.key) ?? defaultTheme.name);
}

ThemeMode toMode(String str) {
  return ThemeMode.values.where((val) => val.name == str).first;
}

extension ThemeModeEx on ThemeMode {
  String get key => toString().split('.').first;
  String get name => toString().split('.').last;
}
