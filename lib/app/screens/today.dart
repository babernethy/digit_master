import 'package:collection/collection.dart';
import 'package:digit_master/app/screens/guess_entry_widget.dart';
import 'package:digit_master/app/screens/hint_widget.dart';
import 'package:digit_master/app/screens/instructions_widget.dart';
import 'package:digit_master/app/screens/puzzle_widget.dart';
import 'package:digit_master/app/services/code_puzzle.dart';
import 'package:digit_master/app/services/today_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          bottom: const TabBar(
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
            "Digit Master - Crack the Code",
            style: titleTextStyle,
          ),
        ),
        body: TabBarView(
          children: [
            const InstructionsWidget(),
            FiveGuessesWidget(
              code: code,
              guesses: todayState.guesses,
              todayStateActions: todayStateActions,
              scale: 1,
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                if (constraints.maxWidth > 640) {
                  return FiveCluesWidget(
                    code: code,
                    puzzle: puzzle,
                    todayStateActions: todayStateActions,
                    todayState: todayState,
                  );
                } else {
                  return FiveCluesWidget(
                    code: code,
                    puzzle: puzzle,
                    todayStateActions: todayStateActions,
                    todayState: todayState,
                  );
// need to figure this out another time
                  final scale = constraints.maxWidth / 700;
                  return FiveCluesWidget(
                    code: code,
                    puzzle: puzzle,
                    scale: scale,
                    todayStateActions: todayStateActions,
                    todayState: todayState,
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
    required this.todayStateActions,
    required this.todayState,
  });

  final List<int> code;
  final CodePuzzle? puzzle;
  final double scale;
  final TodayState todayStateActions;
  final TodayStateData todayState;

  @override
  Widget build(BuildContext context) {
    final instructionStyle =
        GoogleFonts.tekoTextTheme().displayLarge?.copyWith(fontSize: 22);
    return SingleChildScrollView(
      child: Transform.scale(
        scale: scale,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Here are five clues, you have one guess to crack the code.',
              style: instructionStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            if (puzzle != null) PuzzleWidget(puzzle: puzzle!),
            if (todayState.oneGuess.isEmpty)
              GuessEntryWidget(
                onGuess: (guess) => {
                  debugPrint(guess.toString()),
                  todayStateActions.updateOneGuess(guess),
                },
              ),
            if (todayState.oneGuess.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: HintWidget(
                  guess: todayState.oneGuess,
                  code: code,
                ),
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
    final instructionStyle =
        GoogleFonts.tekoTextTheme().displayLarge?.copyWith(fontSize: 22);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Try to guess the code in 5 guesses (or as few as possible).',
            style: instructionStyle,
          ),
          const SizedBox(
            height: 10,
          ),
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
          const Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Image(
              image: AssetImage('assets/images/logo.png'),
              width: 225,
            ),
          ),
        ],
      ),
    );
  }
}
