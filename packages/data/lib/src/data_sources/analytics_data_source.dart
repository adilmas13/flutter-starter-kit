import 'package:firebase_analytics/firebase_analytics.dart';

abstract class AnalyticsDataSource {
  Future setUserId(String id);

  Future setUserProperties(Map<String, dynamic> properties);

  Future logScreenView(String screenView);

  Future logExitScreenView(String screenView);

  Future logEvent(String event, Map<String, dynamic> parameters);

  Future setCommonProperties(Map<String, dynamic> properties);
}

class FirebaseAnalyticsDataSource implements AnalyticsDataSource {
  final _instance = FirebaseAnalytics.instance;

  @override
  Future logEvent(String event, Map<String, dynamic> parameters) {
    parameters.removeWhere((_, value) => value == null);
    Map<String, Object> params =
        parameters.map((key, value) => MapEntry(key, value as Object));
    return _instance.logEvent(name: event, parameters: params);
  }

  @override
  Future logScreenView(String screenView) {
    return _instance.logScreenView(screenName: screenView);
  }

  @override
  Future setCommonProperties(Map<String, dynamic> properties) {
    return Future.value();
  }

  @override
  Future setUserId(String id) {
    return _instance.setUserId(id: id);
  }

  @override
  Future setUserProperties(Map<String, dynamic> properties) {
    properties.removeWhere((_, value) => value == null);
    final it = properties.entries
        .map((it) => _instance.setUserProperty(name: it.key, value: it.value))
        .toList();
    return Future.wait(it);
  }

  @override
  Future logExitScreenView(String screenView) {
    return _instance.logEvent(name: "Exit screen $screenView");
  }
}
