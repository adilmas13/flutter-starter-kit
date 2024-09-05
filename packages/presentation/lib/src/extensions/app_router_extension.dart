import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

extension AppRouterExtension on BuildContext {
  Future<T?> goToAndReplace<T>(PageRouteInfo route) {
    if (mounted) {
      return router.replace<T>(route);
    }
    return Future.value();
  }

  Future<T?> goTo<T>(PageRouteInfo route) {
    if (mounted) {
      return router.push<T>(route);
    }
    return Future.value();
  }

  Future<void> replaceRouteStack(List<PageRouteInfo> routes) {
    if (mounted) {
      return router.replaceAll(routes);
    }
    return Future.value();
  }

  void goBack() {
    if (mounted) {
      return router.back();
    }
    return;
  }
}
