class BaseException implements Exception {
  final String message;
  final Object? error;
  final StackTrace? stackTrace;

  BaseException(this.message, [this.error, this.stackTrace = StackTrace.empty]);
}
