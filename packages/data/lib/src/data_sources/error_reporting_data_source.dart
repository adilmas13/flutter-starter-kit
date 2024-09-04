import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/widgets.dart';

abstract class ErrorReportingDataSource {
  Future setUser(String id);

  Future setCustomKey({
    required String key,
    required Object value,
  });

  Future log(
    String message,
  );

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

class FirebaseErrorReportingDataSource implements ErrorReportingDataSource {
  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  FirebaseErrorReportingDataSource();

  @override
  Future setUser(String id) async {
    return await _crashlytics.setUserIdentifier(id);
  }

  @override
  Future setCustomKey({required String key, required Object value}) async {
    return await _crashlytics.setCustomKey(key, value);
  }

  @override
  Future log(String message) async {
    return await _crashlytics.log(message);
  }

  @override
  Future reportError({
    required String source,
    required Object error,
    StackTrace? stackTrace,
    isFatal = false,
    Iterable<Object> information = const [],
  }) async {
    final it = await _crashlytics.recordError(
      error,
      stackTrace,
      reason: source,
      information: information,
    );
    return;
  }

  @override
  Future reportFlutterError({
    required FlutterErrorDetails details,
    bool isFatal = false,
  }) async {
    if (isFatal) {
      return await _crashlytics.recordFlutterFatalError(details);
    }
    return await _crashlytics.recordFlutterError(details);
  }
}
