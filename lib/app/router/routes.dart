import 'package:digit_master/app/screens/home.dart';
import 'package:digit_master/app/screens/today.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
)
class HomeRoute extends GoRouteData {
  const HomeRoute();
  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

@TypedGoRoute<TodayRoute>(
  path: '/today',
)
class TodayRoute extends GoRouteData {
  const TodayRoute();
 static const path = '/today';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const TodayScreen();
}
