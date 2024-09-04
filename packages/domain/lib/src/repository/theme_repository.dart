import 'package:result_dart/result_dart.dart';
import 'package:domain/src/entity/theme_style/theme_style.dart';

abstract class ThemeRepository {
  Future<Result<ThemeStyle, Unit>> fetchTheme();

  Future<Result<Unit, Unit>> updateTheme(ThemeStyle style);
}
