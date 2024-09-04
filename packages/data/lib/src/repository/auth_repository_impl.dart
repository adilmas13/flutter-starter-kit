import 'package:result_dart/src/result.dart';
import 'package:data/src/data_sources/auth_data_source.dart';
import 'package:data/src/data_sources/token_data_source.dart';
import 'package:data/src/dto/request/login_request/login_request.dart';
import 'package:data/src/dto/request/otp_request/otp_request.dart';
import 'package:data/src/dto/request/signup_request/signup_request.dart';
import 'package:data/src/repository/base_repository.dart';
import 'package:domain/domain.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  final AuthDataSource _authDataSource;
  final TokenDataSource _tokenDataSource;

  AuthRepositoryImpl({
    required AuthDataSource authDataSource,
    required TokenDataSource tokenDataSource,
    required super.errorReportingDataSource,
  })  : _authDataSource = authDataSource,
        _tokenDataSource = tokenDataSource;

  @override
  Future<Result<bool, ApiError>> login({
    required String email,
    required String password,
  }) async {
    return await parseOrError(() async {
      final result = await _authDataSource.login(
        request: LoginRequest(email: email, password: password),
      );
      _saveToken(
        accessToken: result.data.token.accessToken,
        refreshToken: result.data.token.refreshToken,
      );
      return true;
    });
  }

  @override
  Future<Result<bool, ApiError>> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    return await parseOrError(() async {
      final result = await _authDataSource.signup(
        request: SignupRequest(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
        ),
      );
      _saveToken(
        accessToken: result.data.token.accessToken,
        refreshToken: result.data.token.refreshToken,
      );
      return true;
    });
  }

  @override
  Future<Result<bool, ApiError>> validateOTP({required String otp}) async {
    return await parseOrError(() async {
      final result = await _authDataSource.validateOtp(
        request: OtpRequest(otp: otp),
      );
      _saveToken(
        accessToken: result.data.token.accessToken,
        refreshToken: result.data.token.refreshToken,
      );
      return true;
    });
  }

  void _saveToken({required String accessToken, required String refreshToken}) {
    _tokenDataSource.setAccessToken(accessToken);
    _tokenDataSource.setRefreshToken(refreshToken);
  }
}
