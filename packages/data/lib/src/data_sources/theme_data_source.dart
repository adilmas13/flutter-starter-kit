import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeDataSource {
  Future set(String theme);

  Future<String> get();
}

class LocalThemeDataSource implements ThemeDataSource {
  final String _keyTheme = "theme";

  final _preferences = SharedPreferences.getInstance();

  @override
  Future<String> get() async {
    final preferences = await _preferences;
    return preferences.getString(_keyTheme) ?? "system";
  }

  @override
  Future set(String theme) async {
    final preferences = await _preferences;
    return preferences.setString(_keyTheme, theme);
  }
}
