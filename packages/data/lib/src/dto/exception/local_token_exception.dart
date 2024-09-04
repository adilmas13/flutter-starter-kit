import 'package:data/src/dto/exception/base_exception.dart';

class LocalTokenException extends BaseException {
  LocalTokenException(super.message, super.error, super.stackTrace);

  @override
  String toString() => "LocalTokenException: $message";
}
