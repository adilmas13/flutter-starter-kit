import 'package:domain/domain.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore extends _UserStore with _$UserStore {
  UserStore({required super.tokenRepository});
}

abstract class _UserStore with Store {
  final TokenRepository _tokenRepository;

  _UserStore({required TokenRepository tokenRepository})
      : _tokenRepository = tokenRepository;

  logout() async {
    await _tokenRepository.clear();
  }
}
