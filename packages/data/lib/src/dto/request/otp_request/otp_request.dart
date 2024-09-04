import 'package:json_annotation/json_annotation.dart';

part 'otp_request.g.dart';

@JsonSerializable(createFactory: false)
class OtpRequest {
  @JsonKey(name: "otp")
  final String otp;

  OtpRequest({
    required this.otp,
  });

  Map<String, dynamic> toJson() => _$OtpRequestToJson(this);
}
