import 'package:data/src/dto/exception/login_exception.dart';
import 'package:data/src/dto/exception/otp_exception.dart';
import 'package:data/src/dto/exception/signup_exception.dart';
import 'package:data/src/dto/exception/unauthorized_exception.dart';
import 'package:dio/dio.dart';


LoginException parseLoginException(DioException e, StackTrace s) {
  const defaultMessage = "Failed to login";

  if (e.response != null && e.response?.data is Map<String, dynamic>) {
    final message =
        (e.response?.data as Map<String, dynamic>)["message"] ?? defaultMessage;
    return LoginException(message, e, s);
  }

  return LoginException(defaultMessage, e, s);
}

SignupException parseSignupException(DioException e, StackTrace s) {
  const defaultMessage = "Failed to signup";

  if (e.response != null && e.response?.data is Map<String, dynamic>) {
    final message =
        (e.response?.data as Map<String, dynamic>)["message"] ?? defaultMessage;
    return SignupException(message, e, s);
  }

  return SignupException(defaultMessage, e, s);
}

UnauthorizedException parseUnauthorizedException(DioException e, StackTrace s) {
  const defaultMessage = "Unauthorized";

  if (e.response != null && e.response?.data is Map<String, dynamic>) {
    final message =
        (e.response?.data as Map<String, dynamic>)["message"] ?? defaultMessage;
    return UnauthorizedException(message, e, s);
  }

  return UnauthorizedException(defaultMessage, e, s);
}

OtpException parseOtpException(DioException e, StackTrace s) {
  const defaultMessage = "Failed to validate OTP";

  if (e.response != null && e.response?.data is Map<String, dynamic>) {
    final message =
        (e.response?.data as Map<String, dynamic>)["message"] ?? defaultMessage;
    return OtpException(message, e, s);
  }

  return OtpException(defaultMessage, e, s);
}
