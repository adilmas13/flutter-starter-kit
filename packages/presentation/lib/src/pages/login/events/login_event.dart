import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.freezed.dart';

@freezed
sealed class LoginEvent with _$LoginEvent {
  factory LoginEvent.idle() = Idle;

  factory LoginEvent.authorisationInProgress() = InProgress;

  factory LoginEvent.success() = Success;

  factory LoginEvent.error(String message) = Error;
}
