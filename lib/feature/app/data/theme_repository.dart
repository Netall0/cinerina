import 'package:flutter/material.dart';

abstract interface class ThemeRepository {
  Future<void> setThemeModeToggled(bool selected);

  bool isDarkModeToggled();
  
}