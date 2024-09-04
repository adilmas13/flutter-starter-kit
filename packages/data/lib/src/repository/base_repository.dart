import 'package:result_dart/result_dart.dart';
import 'package:data/src/data_sources/error_reporting_data_source.dart';
import 'package:data/src/dto/exception/base_exception.dart';
import 'package:data/src/dto/exception/unauthorized_exception.dart';
import 'package:domain/domain.dart';

class BaseRepository {
  final ErrorReportingDataSource _errorReportingDataSource;

  BaseRepository({
    required ErrorReportingDataSource errorReportingDataSource,
  }) : _errorReportingDataSource = errorReportingDataSource;

  Future<Result<T, E>> parseOrError<T extends Object, E extends BaseError>(
    Future<T> Function() parseFunction,
  ) async {
    try {
      final result = await parseFunction();
      return Result.success(result);
    } on UnauthorizedException catch (e) {
      final error = UnauthorisedError(e.toString()) as E;
      return Result.failure(error);
    } on BaseException catch (e) {
      await _errorReportingDataSource.reportError(
        error: e.error!,
        source: e.toString(),
        isFatal: true,
        stackTrace: e.stackTrace,
      );
      final error = ApiError(e.toString()) as E;
      return Result.failure(error);
    } catch (e, s) {
      await _errorReportingDataSource.reportError(
        error: e,
        source: "Unknown Error",
        isFatal: true,
        stackTrace: s,
      );
      final error = UnknownError(e.toString()) as E;
      return Result.failure(error);
    }
  }
}
