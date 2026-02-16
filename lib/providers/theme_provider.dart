import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeProvider extends ChangeNotifier {
  final _storage = GetStorage();
  bool _isDarkMode = false;

  ThemeProvider() {
    _isDarkMode = _storage.read('darkMode') ?? false;
  }

  bool get isDarkMode => _isDarkMode;

  get themeMode => null;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _storage.write('darkMode', _isDarkMode);
    notifyListeners();
  }
}
