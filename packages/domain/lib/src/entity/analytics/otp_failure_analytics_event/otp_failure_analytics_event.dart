import 'package:json_annotation/json_annotation.dart';
import 'package:domain/src/entity/analytics/base_analytics_event.dart';

part 'otp_failure_analytics_event.g.dart';

@JsonSerializable(createFactory: false)
class OtpFailureAnalyticsEvent extends BaseAnalyticsEvent {
  OtpFailureAnalyticsEvent() : super(eventName: "OTP validation failed");

  @override
  Map<String, dynamic> toJson() => _$OtpFailureAnalyticsEventToJson(this);
}
