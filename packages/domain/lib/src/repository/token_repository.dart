import 'package:result_dart/result_dart.dart';
import 'package:domain/src/entity/error.dart';

abstract class TokenRepository<E extends BaseError> {
  Future<Result<Unit, E>> clear();
}
