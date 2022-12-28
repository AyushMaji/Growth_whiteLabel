// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:olga/models/api_model/api_model.dart';
import 'package:olga/screens/auth/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/start/starting_screen.dart';

class MyRouteObserver extends RouteObserver {
  void saveLastRoute(Route lastRoute) {
    final SharedPreferences prefs = ApiModel.prefs!;
    prefs.setString('last_route', lastRoute.settings.name ?? StartingScreen.id);
  }

  @override
  void didPop(Route? route, Route? previousRoute) {
    print("=========== route route ========");
    print(route);
    print(previousRoute);
    saveLastRoute(previousRoute!);
    super.didPop(route!, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    print("=========== push route ========");
    print(route);

    saveLastRoute(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    print("=========== removed route ========");
    print(route);

    saveLastRoute(route);
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    print("=========== newRoute route ========");
    print(newRoute);
    print("=========== oldRoute route ========");
    print(oldRoute);

    saveLastRoute(newRoute!);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
