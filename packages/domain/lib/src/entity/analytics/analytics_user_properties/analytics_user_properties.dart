import 'package:json_annotation/json_annotation.dart';

part 'analytics_user_properties.g.dart';

@JsonSerializable(createFactory: false)
class AnalyticsUserProperties {
  @JsonKey(name: "email")
  final String email;

  AnalyticsUserProperties({required this.email});

  Map<String, dynamic> toJson() => _$AnalyticsUserPropertiesToJson(this);
}
