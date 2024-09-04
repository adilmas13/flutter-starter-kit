import 'package:result_dart/src/result.dart';
import 'package:result_dart/src/unit.dart';
import 'package:data/src/data_sources/theme_data_source.dart';
import 'package:data/src/repository/base_repository.dart';
import 'package:domain/domain.dart';

class ThemeRepositoryImpl extends BaseRepository implements ThemeRepository {
  final ThemeDataSource _themeDataSource;

  ThemeRepositoryImpl({
    required ThemeDataSource themeDataSource,
    required super.errorReportingDataSource,
  }) : _themeDataSource = themeDataSource;

  @override
  Future<Result<ThemeStyle, Unit>> fetchTheme() async {
    return await parseOrError(() async {
      final theme = await _themeDataSource.get();
      return switch (theme) {
        'light' => ThemeStyle.light(),
        'dark' => ThemeStyle.dark(),
        _ => ThemeStyle.system(),
      };
    });
  }

  @override
  Future<Result<Unit, Unit>> updateTheme(ThemeStyle style) async {
    return await parseOrError(() async {
      final theme = style.when(
        system: () => "system",
        light: () => "light",
        dark: () => "dark",
      );
      return await _themeDataSource.set(theme);
    });
  }
}
