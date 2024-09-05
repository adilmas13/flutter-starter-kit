import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_event.freezed.dart';

@freezed
sealed class SplashEvent with _$SplashEvent {
  factory SplashEvent.pending() = Pending;

  factory SplashEvent.authorised() = Authorised;

  factory SplashEvent.unauthorised() = Unauthorised;
}
