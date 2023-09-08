import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _localeKey = 'locale';
const _themeModeKey = 'themeMode';
const _roughTranslationDisclaimerDismissedKey = 'roughTranslationDisclaimerDismissed';

class LocalStorageService {
  LocalStorageService._();
  static final instance = LocalStorageService._();

  late SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setLocale(String languageCode) {
    return _sharedPreferences.setString(_localeKey, languageCode);
  }

  String? getLocale() {
    return _sharedPreferences.getString(_localeKey);
  }

  Future<bool> setThemeMode(ThemeMode themeMode) {
    return _sharedPreferences.setInt(_themeModeKey, themeMode.index);
  }

  ThemeMode? getThemeMode() {
    final themeModeIndex = _sharedPreferences.getInt(_themeModeKey);
    return themeModeIndex != null ? ThemeMode.values.elementAtOrNull(themeModeIndex) : null;
  }

  Future<bool> setRoughTranslationDisclaimerDismissed() {
    return _sharedPreferences.setBool(_roughTranslationDisclaimerDismissedKey, true);
  }

  bool getRoughTranslationDisclaimerDismissed() {
    return _sharedPreferences.getBool(_roughTranslationDisclaimerDismissedKey) ?? false;
  }
}
