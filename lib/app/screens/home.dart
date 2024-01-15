import 'package:digit_master/app/router/routes.dart';
import 'package:digit_master/app/services/app_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    final appStateActions = ref.watch(appStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n().appHomeScreenName),
        actions: [
           IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              appStateActions
                  .showSnackBarMessage(context.l10n().appHomeScreenButtonMessage);
            },
          ),
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              appStateActions.setLoading(isLoading: true);
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: ElevatedButton(
            onPressed: () {
              const TodayRoute().push(context);
            },
            child:  Text(context.l10n().appTodayScreenName),
          ), ),
        ],
      ),
    );
  }
}
