import 'package:cinerina/feature/app/data/theme_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class IThemeRepository implements ThemeRepository {
  IThemeRepository(this.pref) : super();

  final SharedPreferences pref;

  static const String _kThemeModeKey = 'isDarkModeToggled';

  @override
  bool isDarkModeToggled() {
    return pref.getBool(_kThemeModeKey) ?? false;
  }

  @override
  Future<void> setThemeModeToggled(bool selected) async {
    await pref.setBool(_kThemeModeKey, selected);
  }
}
