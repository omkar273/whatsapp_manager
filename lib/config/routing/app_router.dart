import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_manager/main.dart';

class WPmanagerRouter {
  static final _instance = WPmanagerRouter.init();
  static get instance => _instance;
  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GlobalKey<ScaffoldMessengerState> parentScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  WPmanagerRouter.init() {
    final List<RouteBase> routes = [
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => getPage(const HomeScreen(), state),
      )
    ];
    router = GoRouter(
      initialLocation: '/home',
      navigatorKey: parentNavigatorKey,
      routes: routes,
    );
  }
  static Page getPage(Widget child, GoRouterState state) =>
      MaterialPage(child: child, key: state.pageKey);
}
