import 'package:data/src/dto/exception/base_exception.dart';

class UnauthorizedException extends BaseException {
  UnauthorizedException(super.message, super.error, super.stackTrace);

  @override
  String toString() => "UnauthorizedException: $message";
}
