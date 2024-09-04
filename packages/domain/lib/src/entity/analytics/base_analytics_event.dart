import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(createFactory: false, createToJson: false)
class BaseAnalyticsEvent {
  @JsonKey(includeToJson: false)
  String eventName;

  BaseAnalyticsEvent({required this.eventName});

  Map<String, dynamic> toJson() => {};
}
