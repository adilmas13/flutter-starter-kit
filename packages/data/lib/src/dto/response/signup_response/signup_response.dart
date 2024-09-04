import 'package:data/src/dto/response/token_response/token_response.dart';
import 'package:data/src/dto/response/user_response/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  @JsonKey(name: "auth")
  final TokenResponse token;

  @JsonKey(name: "user")
  final UserResponse user;

  SignupResponse({
    required this.token,
    required this.user,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}
