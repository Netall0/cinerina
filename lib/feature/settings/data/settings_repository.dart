abstract interface class SettingsRepository {
  Future<void> setThemeModeToggled(bool selected);

  bool isDarkModeToggled();

  Future<void> setLayoutToggled(bool selected);

  bool isListLayoutToggled();
}
