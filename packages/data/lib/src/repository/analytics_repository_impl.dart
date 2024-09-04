import 'package:data/src/data_sources/analytics_data_source.dart';
import 'package:domain/domain.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final AnalyticsDataSource _dataSource;

  AnalyticsRepositoryImpl({required AnalyticsDataSource dataSource})
      : _dataSource = dataSource;

  @override
  Future logEvent<T extends BaseAnalyticsEvent>(T event) =>
      _dataSource.logEvent(event.eventName, event.toJson());

  @override
  Future logScreenView(String screenView) =>
      _dataSource.logScreenView(screenView);

  @override
  Future setCommonProperties(AnalyticsCommonProperties properties) =>
      _dataSource.setCommonProperties(properties.toJson());

  @override
  Future setUserId(String id) => _dataSource.setUserId(id);

  @override
  Future setUserProperties(AnalyticsUserProperties properties) =>
      _dataSource.setUserProperties(properties.toJson());

  @override
  Future logExitScreenView(String screenView) =>
      _dataSource.logExitScreenView(screenView);
}
