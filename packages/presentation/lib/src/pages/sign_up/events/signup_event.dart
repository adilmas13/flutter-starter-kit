import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_event.freezed.dart';

@freezed
sealed class SignupEvent with _$SignupEvent {
  factory SignupEvent.idle() = Idle;

  factory SignupEvent.authorisationInProgress() = InProgress;

  factory SignupEvent.success() = Success;

  factory SignupEvent.error(String message) = Error;
}
