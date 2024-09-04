import 'package:flutter/widgets.dart';
import 'package:data/src/data_sources/error_reporting_data_source.dart';
import 'package:domain/domain.dart';

class ErrorReportingRepositoryImpl implements ErrorReportingRepository {
  final ErrorReportingDataSource _dataSource;

  ErrorReportingRepositoryImpl({
    required ErrorReportingDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future log(String message) {
    return _dataSource.log(message);
  }

  @override
  Future reportError(
      {required String source,
      required Object error,
      StackTrace? stackTrace,
      isFatal = false,
      Iterable<Object> information = const []}) {
    return _dataSource.reportError(
      source: source,
      error: error,
      stackTrace: stackTrace,
      information: information,
      isFatal: isFatal,
    );
  }

  @override
  Future reportFlutterError({
    required FlutterErrorDetails details,
    bool isFatal = false,
  }) {
    return _dataSource.reportFlutterError(details: details, isFatal: isFatal);
  }

  @override
  Future setCustomKey({required String key, required Object value}) {
    return _dataSource.setCustomKey(key: key, value: value);
  }

  @override
  Future setUser(String id) {
    return _dataSource.setUser(id);
  }
}
