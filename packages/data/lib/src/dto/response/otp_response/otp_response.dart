import 'package:data/src/dto/response/token_response/token_response.dart';
import 'package:data/src/dto/response/user_response/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_response.g.dart';

@JsonSerializable()
class OtpResponse {
  @JsonKey(name: "auth")
  final TokenResponse token;

  @JsonKey(name: "user")
  final UserResponse user;

  OtpResponse({
    required this.token,
    required this.user,
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OtpResponseToJson(this);
}
