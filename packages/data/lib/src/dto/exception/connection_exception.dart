import 'package:data/src/dto/exception/base_exception.dart';

class ConnectionException extends BaseException {
  ConnectionException([Object? error, StackTrace? stackTrace])
      : super("A connection error occurred", error,
            stackTrace ?? StackTrace.empty);

  @override
  String toString() => "ConnectionException: $message";
}
