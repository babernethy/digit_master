import 'package:digit_master/app/screens/today.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onboarding_overlay/onboarding_overlay.dart';

part 'routes.g.dart';

// @TypedGoRoute<HomeRoute>(
//   path: '/',
// )
// class HomeRoute extends GoRouteData {
//   const HomeRoute();
//   static const path = '/';

//   @override
//   Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
// }

@TypedGoRoute<TodayRoute>(
  path: '/',
)
class TodayRoute extends GoRouteData {
  const TodayRoute();
  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    //final OnboardingState? onboarding = Onboarding.of(context);
    final key = GlobalKey<OnboardingState>();
    return Onboarding(
      key: key,
      steps: steps,
      onChanged: (int index) {
        debugPrint('----index $index');
        if (index == 5) {
          /// interrupt onboarding on specific step
          /// widget.onboardingKey.currentState.hide();
          /// or do something else
        }
      },
      child: const TodayScreen(),
    );
  }
}
