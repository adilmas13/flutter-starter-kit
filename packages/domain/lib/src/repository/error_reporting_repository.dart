import 'package:flutter/widgets.dart';

abstract class ErrorReportingRepository {
  Future setUser(String id);

  Future setCustomKey({
    required String key,
    required Object value,
  });

  Future log(String message);

  Future reportError({
    required String source,
    required Object error,
    StackTrace? stackTrace,
    isFatal = false,
    Iterable<Object> information = const [],
  });

  Future reportFlutterError({
    required FlutterErrorDetails details,
    bool isFatal = false,
  });
}
