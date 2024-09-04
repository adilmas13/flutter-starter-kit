import 'package:json_annotation/json_annotation.dart';
import 'package:domain/src/entity/analytics/base_analytics_event.dart';

part 'login_success_analytics_event.g.dart';

@JsonSerializable(createFactory: false)
class LoginSuccessAnalyticsEvent extends BaseAnalyticsEvent {
  @JsonKey(name: "type")
  final String type;

  LoginSuccessAnalyticsEvent({
    required this.type,
  }) : super(eventName: "Login Success");

  @override
  Map<String, dynamic> toJson() => _$LoginSuccessAnalyticsEventToJson(this);
}
