import 'dart:io';

import 'package:data/src/dto/exception/base_exception.dart';
import 'package:data/src/dto/exception/connection_exception.dart';
import 'package:data/src/dto/exception/unknown_exception.dart';
import 'package:data/src/parsers/error_parser.dart';
import 'package:dio/dio.dart';

class BaseRemoteDataSource {
  parseError<T extends BaseException>(Object error, StackTrace stackTrace,
      T Function(DioException exception, StackTrace stacktrace) fn) {
    if (error is! DioException) {
      return UnknownException("Unknown error", error, stackTrace);
    }

    if (error.response?.statusCode == HttpStatus.unauthorized) {
      return parseUnauthorizedException(error, stackTrace);
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
      case DioExceptionType.cancel:
        return ConnectionException(error, stackTrace);
      case DioExceptionType.badResponse:
        return fn(error, stackTrace);
      case DioExceptionType.unknown:
        return UnknownException("Unknown error", error, stackTrace);
    }
  }
}
