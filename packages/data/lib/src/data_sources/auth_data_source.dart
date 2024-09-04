import 'package:data/src/data_sources/base_remote_data_source.dart';
import 'package:data/src/dto/exception/login_exception.dart';
import 'package:data/src/dto/exception/otp_exception.dart';
import 'package:data/src/dto/exception/signup_exception.dart';
import 'package:data/src/dto/request/login_request/login_request.dart';
import 'package:data/src/dto/request/otp_request/otp_request.dart';
import 'package:data/src/dto/request/signup_request/signup_request.dart';
import 'package:data/src/dto/response/api_response/api_response.dart';
import 'package:data/src/dto/response/login_response/login_response.dart';
import 'package:data/src/dto/response/otp_response/otp_response.dart';
import 'package:data/src/dto/response/signup_response/signup_response.dart';
import 'package:data/src/network/rest_client.dart';
import 'package:data/src/parsers/error_parser.dart';


abstract class AuthDataSource {
  Future<ApiResponse<LoginResponse>> login({
    required LoginRequest request,
  });

  Future<ApiResponse<SignupResponse>> signup({
    required SignupRequest request,
  });

  Future<ApiResponse<OtpResponse>> validateOtp({
    required OtpRequest request,
  });
}

class AuthDataSourceImpl extends BaseRemoteDataSource
    implements AuthDataSource {
  final RestClient _restClient;

  AuthDataSourceImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<ApiResponse<LoginResponse>> login({
    required LoginRequest request,
  }) async {
    try {
      return await _restClient.login(request);
    } catch (e, s) {
      throw parseError<LoginException>(e, s, parseLoginException);
    }
  }

  @override
  Future<ApiResponse<SignupResponse>> signup({
    required SignupRequest request,
  }) async {
    try {
      return await _restClient.signup(request);
    } catch (e, s) {
      throw parseError<SignupException>(e, s, parseSignupException);
    }
  }

  @override
  Future<ApiResponse<OtpResponse>> validateOtp({
    required OtpRequest request,
  }) async {
    try {
      return await _restClient.validateOtp(request);
    } catch (e, s) {
      throw parseError<OtpException>(e, s, parseOtpException);
    }
  }
}
