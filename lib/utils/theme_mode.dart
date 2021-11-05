import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const defaultTheme = ThemeMode.system;

Future<void> saveThemeMode(ThemeMode mode) async {
  final pref = await SharedPreferences.getInstance();
  pref.setString(mode.key, mode.name);
}

Future<ThemeMode> loadThemeMode(SharedPreferences? pref) async {
  if (pref != null) {
    return toMode(pref.getString(defaultTheme.key) ?? defaultTheme.name);
  }
  final _pref = await SharedPreferences.getInstance();
  return toMode(_pref.getString(defaultTheme.key) ?? defaultTheme.name);
}

ThemeMode toMode(String str) {
  return ThemeMode.values.where((val) => val.name == str).first;
}

extension ThemeModeEx on ThemeMode {
  String get key => toString().split('.').first;
  String get name => toString().split('.').last;
}
