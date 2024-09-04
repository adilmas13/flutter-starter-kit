import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_style.freezed.dart';

@freezed
sealed class ThemeStyle with _$ThemeStyle {
  factory ThemeStyle.system() = System;

  factory ThemeStyle.light() = Light;

  factory ThemeStyle.dark() = Dark;
}
