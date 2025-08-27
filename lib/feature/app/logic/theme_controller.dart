import 'package:cinerina/feature/app/data/i_theme_repository.dart';
import 'package:flutter/material.dart';

final class ThemeController extends ChangeNotifier {
  Brightness brightness;
  final IThemeRepository _themeRepository;

  ThemeController({
    required this.brightness,
    required IThemeRepository themeRepository,
  }) : _themeRepository = themeRepository{
    loadTheme();
  }

  get isDark => brightness == Brightness.dark;

  void loadTheme() async {
    final isDark = _themeRepository.isDarkModeToggled();
    brightness = isDark ? Brightness.dark : Brightness.light;
    notifyListeners();
  }

  void toggleTheme() async {
    brightness = isDark ? Brightness.light : Brightness.dark;
    notifyListeners();

    await _themeRepository.setThemeModeToggled(isDark);
  }
}
