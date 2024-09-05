// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on _AppStore, Store {
  late final _$themeAtom = Atom(name: '_AppStore.theme', context: context);

  @override
  ThemeStyle get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(ThemeStyle value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  late final _$_initThemeAsyncAction =
      AsyncAction('_AppStore._initTheme', context: context);

  @override
  Future _initTheme() {
    return _$_initThemeAsyncAction.run(() => super._initTheme());
  }

  late final _$setThemeAsyncAction =
      AsyncAction('_AppStore.setTheme', context: context);

  @override
  Future setTheme(ThemeStyle themeStyle) {
    return _$setThemeAsyncAction.run(() => super.setTheme(themeStyle));
  }

  @override
  String toString() {
    return '''
theme: ${theme}
    ''';
  }
}
