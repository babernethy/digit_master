import 'package:digit_master/app/router/routes.dart';
import 'package:digit_master/app/screens/guess_entry_widget.dart';
import 'package:digit_master/app/screens/hint_widget.dart';
import 'package:digit_master/app/screens/puzzle_widget.dart';
import 'package:digit_master/app/services/app_state.dart';
import 'package:digit_master/app/services/code_puzzle.dart';
import 'package:digit_master/app/services/today_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    const textStyle = TextStyle(color: Colors.yellow);
    final titleTextStyle = GoogleFonts.cinzelDecorativeTextTheme()
        .headlineLarge
        ?.copyWith(color: Colors.white);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.lightBlue.shade300,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Instructions",
                  style: textStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Five Guesses",
                  style: textStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Five Clues",
                  style: textStyle,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.black,
          title: Text(
            "Crack the Code",
            style: titleTextStyle,
          ),
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
            const Text("Instructions"),
            FiveGuessesWidget(
              code: code,
              guesses: todayState.guesses,
              todayStateActions: todayStateActions,
              scale: 1,
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 640) {
                  return FiveCluesWidget(code: code, puzzle: puzzle);
                } else {
                  return FiveCluesWidget(code: code, puzzle: puzzle);
// need to figure this out another time
                  final scale = constraints.maxWidth / 700;
                  return FiveCluesWidget(
                    code: code,
                    puzzle: puzzle,
                    scale: scale,
                  );
                }
              },
            ),
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
    this.scale = 1,
  });

  final List<int> code;
  final CodePuzzle? puzzle;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Transform.scale(
        scale: scale,
        child: Column(
          children: [
            // Text(code.toString()),
            if (puzzle != null) PuzzleWidget(puzzle: puzzle!),
            GuessEntryWidget(
              onGuess: (guess) => {
                debugPrint(guess.toString()),
              },
            ),
          ],
        ),
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
    required this.scale,
  });

  final List<int> code;
  final List<List<int>> guesses;
  final TodayState todayStateActions;
  final double scale;

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
