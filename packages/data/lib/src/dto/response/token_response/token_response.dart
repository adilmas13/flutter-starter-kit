import 'package:json_annotation/json_annotation.dart';

part 'token_response.g.dart';

@JsonSerializable()
class TokenResponse {
  @JsonKey(name: "accessToken")
  final String accessToken;

  @JsonKey(name: "refreshToken")
  final String refreshToken;

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);

  TokenResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}
