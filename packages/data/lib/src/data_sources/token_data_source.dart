import 'package:shared_preferences/shared_preferences.dart';
import 'package:data/src/dto/exception/local_token_exception.dart';

abstract class TokenDataSource {
  Future setAccessToken(String value);

  Future<String?> getAccessToken();

  Future setRefreshToken(String value);

  Future<String?> getRefreshTokenToken();

  Future clear();
}

class LocalTokenDataSource implements TokenDataSource {
  final String _keyAccessToken = "access_token";
  final String _keyRefreshToken = "refresh_token";

  final _preferences = SharedPreferences.getInstance();

  @override
  Future<String?> getAccessToken() async {
    try {
      final preferences = await _preferences;
      return preferences.getString(_keyAccessToken);
    } catch (e, s) {
      throw LocalTokenException("Get access token", e, s);
    }
  }

  @override
  Future<String?> getRefreshTokenToken() async {
    try {
      final preferences = await _preferences;
      return preferences.getString(_keyRefreshToken);
    } catch (e, s) {
      throw LocalTokenException("Get refresh token", e, s);
    }
  }

  @override
  Future setAccessToken(String value) async {
    try {
      final preferences = await _preferences;
      return preferences.setString(_keyAccessToken, value);
    } catch (e, s) {
      throw LocalTokenException("Setting access token", e, s);
    }
  }

  @override
  Future setRefreshToken(String value) async {
    try {
      final preferences = await _preferences;
      return preferences.setString(_keyRefreshToken, value);
    } catch (e, s) {
      throw LocalTokenException("Setting refresh token", e, s);
    }
  }

  @override
  Future clear() async {
    try {
      final preferences = await _preferences;
      await preferences.remove(_keyAccessToken);
      await preferences.remove(_keyRefreshToken);
    } catch (e, s) {
      throw LocalTokenException("Clear token", e, s);
    }
  }
}
