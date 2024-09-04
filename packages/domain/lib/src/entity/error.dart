abstract class BaseError implements Exception {
  final String message;

  BaseError(this.message);

  @override
  String toString() => message;
}

class UnauthorisedError extends BaseError {
  UnauthorisedError(super.message);
}

class ApiError extends BaseError {
  ApiError(super.message);
}

class UnknownError extends BaseError {
  UnknownError(super.message);
}
