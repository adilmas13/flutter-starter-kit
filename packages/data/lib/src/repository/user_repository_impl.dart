import 'package:result_dart/result_dart.dart';
import 'package:data/src/data_sources/token_data_source.dart';
import 'package:data/src/repository/base_repository.dart';
import 'package:domain/domain.dart';

class UserRepositoryImpl extends BaseRepository implements UserRepository {
  final TokenDataSource _tokenDataSource;

  UserRepositoryImpl({
    required super.errorReportingDataSource,
    required TokenDataSource tokenDataSource,
  }) : _tokenDataSource = tokenDataSource;

  @override
  Future<Result<bool, BaseError>> isLoggedIn() async {
    return await parseOrError(() async {
      final token = await _tokenDataSource.getAccessToken();
      return token != null;
    });
  }
}
