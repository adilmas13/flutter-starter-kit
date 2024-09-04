import 'package:json_annotation/json_annotation.dart';
import 'package:domain/src/entity/analytics/base_analytics_event.dart';

part 'otp_success_analytics_event.g.dart';

@JsonSerializable(createFactory: false)
class OtpSuccessAnalyticsEvent extends BaseAnalyticsEvent {
  OtpSuccessAnalyticsEvent() : super(eventName: "OTP validation success");

  @override
  Map<String, dynamic> toJson() => _$OtpSuccessAnalyticsEventToJson(this);
}
