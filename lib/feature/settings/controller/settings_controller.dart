import 'package:cinerina/feature/settings/data/i_settings_repository.dart';
import 'package:flutter/material.dart';
import 'package:uikit/utils/layout_type_enum.dart';

final class SettingsController extends ChangeNotifier {
  Brightness brightness;
  LayoutType layoutType;
  final ISettingsRepository _settingsRepository;

  SettingsController({
    required this.brightness,
    required this.layoutType,
    required ISettingsRepository themeRepository,
  }) : _settingsRepository = themeRepository {
    loadSettings();
  }

  get isList => layoutType == LayoutType.list;

  get isDark => brightness == Brightness.dark;

  void loadSettings() async {
    final isDark = _settingsRepository.isDarkModeToggled();
    final isList = _settingsRepository.isListLayoutToggled();
    brightness = isDark ? Brightness.dark : Brightness.light;
    layoutType = isList ? LayoutType.list : LayoutType.grid;
    notifyListeners();
  }

  void toggleLayout() async {
    layoutType = isList ? LayoutType.grid : LayoutType.list;
    notifyListeners();

    await _settingsRepository.setLayoutToggled(isList);
  }

  void toggleTheme() async {
    brightness = isDark ? Brightness.light : Brightness.dark;
    notifyListeners();

    await _settingsRepository.setThemeModeToggled(isDark);
  }
}
