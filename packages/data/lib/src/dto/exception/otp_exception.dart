import 'package:data/src/dto/exception/base_exception.dart';

class OtpException extends BaseException {
  OtpException(super.message, super.error, super.stackTrace);

  @override
  String toString() => "OtpException: $message";
}
