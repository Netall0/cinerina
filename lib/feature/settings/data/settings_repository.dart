abstract interface class ThemeRepository {
  Future<void> setThemeModeToggled(bool selected);

  Future<bool> isDarkModeToggled();
  
}