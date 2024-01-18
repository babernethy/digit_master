// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $todayRoute,
    ];

RouteBase get $todayRoute => GoRouteData.$route(
      path: '/',
      factory: $TodayRouteExtension._fromState,
    );

extension $TodayRouteExtension on TodayRoute {
  static TodayRoute _fromState(GoRouterState state) => const TodayRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
