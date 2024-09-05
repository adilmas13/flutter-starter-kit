import 'package:domain/domain.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore extends _AppStore with _$AppStore {
  AppStore({
    required super.themeRepository,
  });
}

abstract class _AppStore with Store {
  final ThemeRepository _themeRepository;

  @observable
  ThemeStyle theme = ThemeStyle.system();

  _AppStore({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  init() {
    _initTheme();
  }

  @action
  _initTheme() async {
    final result = await _themeRepository.fetchTheme();
    result.onSuccess((it) => theme = it);
  }

  @action
  setTheme(ThemeStyle themeStyle) async {
    final result = await _themeRepository.updateTheme(themeStyle);
    result.onSuccess((_) => theme = themeStyle);
  }
}
