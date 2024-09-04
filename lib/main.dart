import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:flutter_starter_kit/env/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final diConfigOptions = DiConfigOptions(
  //   apiUrl: Env.apiUrl,
  //   env: Env.env,
  // );
  // initDependencies(
  //   options: diConfigOptions,
  // );
  // await _initApp();
  // _initErrorReporting();
  // runApp(const App());
}

// _initApp() async {
//   final appRepository = di.get<AppRepository>();
//   await appRepository.init();
// }

// void _initErrorReporting() {
//   final errorReportingRepository = di.get<ErrorReportingRepository>();
//   FlutterError.onError = (errorDetails) {
//     errorReportingRepository
//         .reportFlutterError(
//           details: errorDetails,
//           isFatal: true,
//         )
//         .then((_) {});
//   };
//
//   // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
//   PlatformDispatcher.instance.onError = (error, stack) {
//     errorReportingRepository
//         .reportError(
//       error: error,
//       stackTrace: stack,
//       source: "PLATFORM_DISPATCHER",
//       isFatal: true,
//     )
//         .then((_) {
//       print("Successfully reported Error");
//     }).catchError((err) {
//       print("Failed to Report Error: $err");
//       print(err);
//     });
//
//     return true;
//   };
// }
