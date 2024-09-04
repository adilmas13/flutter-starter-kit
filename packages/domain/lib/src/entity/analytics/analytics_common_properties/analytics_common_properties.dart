import 'package:json_annotation/json_annotation.dart';

part 'analytics_common_properties.g.dart';

@JsonSerializable(createFactory: false)
class AnalyticsCommonProperties {
  @JsonKey(name: "version")
  final String version;

  AnalyticsCommonProperties({required this.version});

  Map<String, dynamic> toJson() => _$AnalyticsCommonPropertiesToJson(this);
}
