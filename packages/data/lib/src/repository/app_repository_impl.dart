import 'package:data/src/data_sources/firebase_app_data_source.dart';
import 'package:domain/domain.dart';


class AppRepositoryImpl implements AppRepository {
  final AppDataSource _appDataSource;

  AppRepositoryImpl({
    required AppDataSource appDataSource,
  }) : _appDataSource = appDataSource;

  @override
  Future init() => _appDataSource.init();
}
