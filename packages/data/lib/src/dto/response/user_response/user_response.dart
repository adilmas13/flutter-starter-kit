import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "email")
  final String email;

  @JsonKey(name: "firstName")
  final String firstName;

  @JsonKey(name: "lastName")
  final String lastName;

  @JsonKey(name: "uuid")
  final String userId;

  @JsonKey(name: "profilePic")
  final String? profilePic;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  UserResponse({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.userId,
    required this.profilePic,
  });

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
