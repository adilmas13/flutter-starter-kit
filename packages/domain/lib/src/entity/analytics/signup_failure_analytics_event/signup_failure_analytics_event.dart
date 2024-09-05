import 'package:json_annotation/json_annotation.dart';
import 'package:domain/src/entity/analytics/base_analytics_event.dart';

part 'signup_failure_analytics_event.g.dart';

@JsonSerializable(createFactory: false)
class SignupFailureAnalyticsEvent extends BaseAnalyticsEvent {
  @JsonKey(name: "type")
  final String type;

  SignupFailureAnalyticsEvent({
    required this.type,
  }) : super(eventName: "Signup Failure");

  @override
  Map<String, dynamic> toJson() => _$SignupFailureAnalyticsEventToJson(this);
}
