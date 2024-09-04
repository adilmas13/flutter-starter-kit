import 'package:result_dart/result_dart.dart';
import 'package:domain/src/entity/error.dart';

abstract class UserRepository<E extends BaseError> {
  Future<Result<bool, E>> isLoggedIn();
}
