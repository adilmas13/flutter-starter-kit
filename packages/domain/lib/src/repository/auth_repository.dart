import 'package:result_dart/result_dart.dart';
import 'package:domain/src/entity/error.dart';

abstract class AuthRepository<E extends BaseError> {
  Future<Result<bool, ApiError>> login({
    required String email,
    required String password,
  });

  Future<Result<bool, ApiError>> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });

  Future<Result<bool, ApiError>> validateOTP({
    required String otp,
  });
}
