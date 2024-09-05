import 'package:json_annotation/json_annotation.dart';
import 'package:domain/src/entity/analytics/base_analytics_event.dart';

part 'signup_success_analytics_event.g.dart';

@JsonSerializable(createFactory: false)
class SignupSuccessAnalyticsEvent extends BaseAnalyticsEvent {
  @JsonKey(name: "type")
  final String type;

  SignupSuccessAnalyticsEvent({
    required this.type,
  }) : super(eventName: "Signup Success");

  @override
  Map<String, dynamic> toJson() => _$SignupSuccessAnalyticsEventToJson(this);
}
