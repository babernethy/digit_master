import 'package:digit_master/app/router/routes.dart';
import 'package:digit_master/app/screens/guess_entry_widget.dart';
import 'package:digit_master/app/screens/hint_widget.dart';
import 'package:digit_master/app/screens/puzzle_widget.dart';
import 'package:digit_master/app/services/app_state.dart';
import 'package:digit_master/app/services/code_puzzle.dart';
import 'package:digit_master/app/services/today_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateProvider);
    final appStateActions = ref.watch(appStateProvider.notifier);
    final todayState = ref.watch(todayStateProvider);
    final todayStateActions = ref.watch(todayStateProvider.notifier);
    final code = todayState.code;
    final puzzle = todayState.puzzle;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Text("Five Guesses"),
              Text("Five Clues"),
            ],
          ),
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
        body: TabBarView(
          children: [
            FiveGuessesWidget(
                code: code,
                guesses: todayState.guesses,
                todayStateActions: todayStateActions),
            FiveCluesWidget(code: code, puzzle: puzzle),
          ],
        ),
      ),
    );
  }
}

class FiveCluesWidget extends StatelessWidget {
  const FiveCluesWidget({
    super.key,
    required this.code,
    this.puzzle,
  });

  final List<int> code;
  final CodePuzzle? puzzle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(code.toString()),
          if (puzzle != null) PuzzleWidget(puzzle: puzzle!),
          GuessEntryWidget(
            onGuess: (guess) => {
              debugPrint(guess.toString()),
            },
          ),
        ],
      ),
    );
  }
}

class FiveGuessesWidget extends StatelessWidget {
  const FiveGuessesWidget({
    super.key,
    required this.code,
    required this.guesses,
    required this.todayStateActions,
  });

  final List<int> code;
  final List<List<int>> guesses;
  final TodayState todayStateActions;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...guesses.map(
            (e) => HintWidget(
              guess: e,
              code: code,
            ),
          ),
          if (guesses.isEmpty ||
              !const DeepCollectionEquality().equals(guesses.last, code))
            GuessEntryWidget(
              onGuess: (guess) => {todayStateActions.addGuess(guess)},
            ),
        ],
      ),
    );
  }
}
