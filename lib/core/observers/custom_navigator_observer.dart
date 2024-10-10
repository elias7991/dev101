import 'dart:developer';

import 'package:flutter/material.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    log(
      'didPush(route: ${route.settings.name},'
      ' previousRoute: ${previousRoute?.settings.name})',
      name: 'NavigatorObserver',
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    log(
      'didPop(route: ${route.settings.name},'
      ' previousRoute: ${previousRoute?.settings.name})',
      name: 'NavigatorObserver',
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    log(
      'didRemove(route: ${route.settings.name},'
      ' previousRoute: ${previousRoute?.settings.name})',
      name: 'NavigatorObserver',
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    log(
      'didReplace(newRoute: ${newRoute?.settings.name},'
      ' previousRoute: ${oldRoute?.settings.name})',
      name: 'NavigatorObserver',
    );
  }
}
