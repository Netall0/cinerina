
import 'package:cinerina/feature/settings/data/settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class ISettingsRepository implements SettingsRepository {
  ISettingsRepository({required SharedPreferences sharedPreferences})
    : _pref = sharedPreferences;

  final SharedPreferences _pref;

  static const String _kThemeModeKey = 'isDarkModeToggled';

  static const String _kLayoutTypeKey = 'isListLayoutToggled';

  @override
  bool isDarkModeToggled() {
    return _pref.getBool(_kThemeModeKey) ?? false;
  }

  @override
  Future<void> setThemeModeToggled(bool selected) async {
    await _pref.setBool(_kThemeModeKey, selected);
  }

  @override
  bool isListLayoutToggled() {
    return _pref.getBool(_kLayoutTypeKey) ?? false;
  }

  @override
  Future<void> setLayoutToggled(bool selected) async {
    await _pref.setBool(_kLayoutTypeKey, selected);
  }
}

