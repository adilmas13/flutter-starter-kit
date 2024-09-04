import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:data/src/data_sources/token_data_source.dart';
import 'package:data/src/dto/request/login_request/login_request.dart';
import 'package:data/src/dto/request/otp_request/otp_request.dart';
import 'package:data/src/dto/request/signup_request/signup_request.dart';
import 'package:data/src/dto/response/api_response/api_response.dart';
import 'package:data/src/dto/response/login_response/login_response.dart';
import 'package:data/src/dto/response/otp_response/otp_response.dart';
import 'package:data/src/dto/response/signup_response/signup_response.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(
    Dio dio, {
    String baseUrl,
  }) = _RestClient;

  @POST('/user-sessions/authenticate')
  Future<ApiResponse<LoginResponse>> login(
    @Body() LoginRequest request,
  );

  @POST('/users')
  Future<ApiResponse<SignupResponse>> signup(
    @Body() SignupRequest request,
  );

  @POST('/validate/otp')
  Future<ApiResponse<OtpResponse>> validateOtp(
    @Body() OtpRequest request,
  );
}

Dio buildClient({
  required String baseUrl,
  required TokenDataSource tokenDataSource,
}) {
  final options = BaseOptions(baseUrl: baseUrl);
  return Dio()
    ..options = options
    ..interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      ),
      _TokenInterceptor(tokenDataSource: tokenDataSource),
    ]);
}

class _TokenInterceptor extends Interceptor {
  final TokenDataSource _tokenDataSource;

  _TokenInterceptor({
    required TokenDataSource tokenDataSource,
  }) : _tokenDataSource = tokenDataSource;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _tokenDataSource.getAccessToken();
    if (token != null) {
      options.headers = {
        ...options.headers,
        HttpHeaders.authorizationHeader: "Bearer $token",
      };
    }
    return handler.next(options);
  }
}
