import 'package:digit_master/app/router/routes.dart';
import 'package:digit_master/app/screens/hint_widget.dart';
import 'package:digit_master/app/screens/puzzle_widget.dart';
import 'package:digit_master/app/services/app_state.dart';
import 'package:digit_master/app/services/code_puzzle.dart';
import 'package:digit_master/app/services/today_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    final appStateActions = ref.watch(appStateProvider.notifier);
    final todayState = ref.watch(todayStateProvider);
    final todayStateActions = ref.watch(todayStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(150),
        title: Text(context.l10n().appTodayScreenName),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              const HomeRoute().go(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('${context.l10n().appTodayScreenName} Screen'),
            Text(todayState.counter.toString()),
            Text(todayState.code.toString()),
            Text(todayState.guess.toString()),
            Text(todayState.correct.toString()),
            Text(todayState.wellPlaced.toString()),
            if (todayState.puzzle != null)
              PuzzleWidget(puzzle: todayState.puzzle!),
            ElevatedButton(
              onPressed: () {
                todayStateActions.increment();
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
