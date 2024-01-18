import 'dart:math';

import 'package:digit_master/app/services/code_puzzle.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'today_state.freezed.dart';
part 'today_state.g.dart';

@freezed
class TodayStateData with _$TodayStateData {
  factory TodayStateData({
    @Default(0) int counter,
    @Default([]) List<int> code,
    @Default([]) List<int> guess,
    @Default([]) List<int> oneGuess,
    @Default([]) List<List<int>> guesses,
    @Default(0) int correct,
    @Default(0) int wellPlaced,
    CodePuzzle? puzzle,
  }) = _TodayStateData;
}

//this will allow for the state of the page/game to grab a puzzle when it loads
//based on the current date, and do that in a safe/future way
@riverpod
Future<CodePuzzle> createPuzzle(CreatePuzzleRef ref, List<int> code) async {
  return createNewPuzzle(code);
}

@riverpod
class TodayState extends _$TodayState {
  TodayStateData? _cachedState;

  @override
  TodayStateData build() {
    if (_cachedState == null) {
      final code = randomCode();
      //cheat, put it in the console if we are testing, etc.
      print(code);
      //won't start with a puzzle, but will load it before they can get past "instructions"
      ref.listen(createPuzzleProvider(code), updatePuzzle);
      return TodayStateData(code: code);
    }
    //don't do all this if we already have a puzzle
    return _cachedState!;
  }

  void updatePuzzle(AsyncValue<CodePuzzle>? last, AsyncValue<CodePuzzle> next) {
    //puzzle will come through as an async value
    //put it in the console if we are testing
    debugPrint(next.asData!.value.toString());

    if (next.hasValue) {
      _cachedState = state.copyWith(puzzle: next.asData!.value);
      state = _cachedState!;
    }
  }

  // Future<void> init(List<int> seed) async {
  //   Future.delayed(const Duration(seconds: 3), () {
  //     debugPrint('------------------ INIT ------------------');
  //   });
  //   int count = 0;
  //   while (count != 6) {
  //     count = await solveMastermind(seed);
  //   }
  // }

  // Future<void> increment() async {
  //   int count = 0;
  //   while (count != 6) {
  //     count = await solveMastermind(state.code);
  //   }
  // }

  Future<void> updateCode() async {
    final code = randomCode();

    _cachedState = state.copyWith(code: code);
    state = _cachedState!;
  }

  Future<void> addGuess(List<int> guess) async {
    final guesses = List<List<int>>.from(state.guesses);
    guesses.add(guess);
    _cachedState = state.copyWith(guesses: guesses);
    state = _cachedState!;
  }

  Future<void> updateGuess() async {
    final guess = randomCode();

    final correct = countMatchingIntegers(state.code, guess);
    final wellPlaced = countCorrectlyPlacedIntegers(state.code, guess);

    _cachedState =
        state.copyWith(guess: guess, correct: correct, wellPlaced: wellPlaced);
    state = _cachedState!;
  }

  Future<void> updateOneGuess(List<int> oneGuess) async {
    _cachedState = state.copyWith(
      oneGuess: oneGuess,
    );
    state = _cachedState!;
  }

  // Future<int> solveMastermind(List<int> secretCode) async {
  //   debugPrint('------------------ SOLVING ------------------');
  //   final Set<List<int>> possibleCodes = generateAllPossibleCodes();
  //   final List<List<int>> guesses = List<List<int>>.empty(growable: true);
  //   // List<int> currentGuess = [0, 1, 2, 3];
  //   // start random - look nicer
  //   List<int> currentGuess = possibleCodes.first.toList();
  //   var guessCount = 1;
  //   while (true) {
  //     final correct = countMatchingIntegers(secretCode, currentGuess);
  //     final wellPlaced = countCorrectlyPlacedIntegers(secretCode, currentGuess);
  //     debugPrint(
  //       '$guessCount: Secret code: $secretCode - Current guess: $currentGuess - $correct number is correct, $wellPlaced are well placed, possible codes: ${possibleCodes.length}',
  //     );
  //     final feedback = getFeedback(secretCode, currentGuess);
  //     if (feedback['correct'] == 4) {
  //       if (guessCount == 6) {
  //         //guesses.removeWhere(currentGuess);
  //         final puzzle = CodePuzzle(
  //           code: secretCode,
  //           hints: guesses,
  //         );
  //         _cachedState = state.copyWith(puzzle: puzzle);
  //         state = _cachedState!;
  //       }
  //       return guessCount;
  //     }

  //     possibleCodes.removeWhere((code) {
  //       final codeFeedback = getFeedback(code, currentGuess);
  //       return codeFeedback['correct'] != feedback['correct'] ||
  //           codeFeedback['misplaced'] != feedback['misplaced'];
  //     });
  //     guesses.add(currentGuess);

  //     currentGuess = possibleCodes.first.toList();

  //     guessCount++;
  //   }
  // }
}

List<int> generateRandomListByDate() {
  final now = DateTime.now();
  // Using the year, month, and day as the seed - should give one unique per day
  final int seed = now.year * 10000 + now.month * 100 + now.day;
  final random = Random(seed);

  final Set<int> uniqueNumbers = {};
  while (uniqueNumbers.length < 4) {
    uniqueNumbers.add(random.nextInt(10)); // Adjust range as needed
  }

  return uniqueNumbers.toList();
}

List<int> randomCode() {
  return generateRandomListByDate();

//may want the ability to add non-date driven random codes/puzzles back in.
  final random = Random();
  final digits = List<int>.generate(10, (i) => i); // List from 0 to 9
  digits.shuffle(random);

  final code = digits.take(4).toList();
  return code;
}

int countMatchingIntegers(List<int> code, List<int> guess) {
  return guess.where((element) => code.contains(element)).length;
}

int countCorrectlyPlacedIntegers(List<int> code, List<int> guess) {
  int count = 0;
  for (int i = 0; i < code.length; i++) {
    if (code[i] == guess[i]) {
      count++;
    }
  }
  return count;
}

Set<List<int>> generateAllPossibleCodes() {
  final Set<List<int>> codes = {};
  for (int i = 0; i < 10000; i++) {
    final code = i.toString().padLeft(4, '0').split('').map(int.parse).toList();
    if (code.toSet().length == 4) {
      codes.add(code);
    }
  }
  // random order will look nicer
  final List<List<int>> shuffledList = codes.toList();
  shuffledList.shuffle();
  return shuffledList.toSet();
}

Map<String, int> getFeedback(List<int> code, List<int> guess) {
  int correct = 0;
  int misplaced = 0;
  for (int i = 0; i < 4; i++) {
    if (code[i] == guess[i]) {
      correct++;
    } else if (code.contains(guess[i])) {
      misplaced++;
    }
  }
  return {'correct': correct, 'misplaced': misplaced};
}

Future<CodePuzzle> createNewPuzzle(List<int> secretCode) async {
  debugPrint('------------------ SOLVING ------------------');
  final Set<List<int>> possibleCodes = generateAllPossibleCodes();
  final List<List<int>> guesses = List<List<int>>.empty(growable: true);
  List<int> currentGuess = possibleCodes.first.toList();
  var guessCount = 1;
  while (true) {
    final feedback = getFeedback(secretCode, currentGuess);
    if (feedback['correct'] == 4) {
      //we want puzzles with five hints/guesses
      if (guessCount == 6) {
        final puzzle = CodePuzzle(
          code: secretCode,
          hints: guesses,
        );
        return puzzle;
      }
      //otherwise we want to try again - recurrsion, yikes!
      return createNewPuzzle(secretCode);
    }

    possibleCodes.removeWhere((code) {
      final codeFeedback = getFeedback(code, currentGuess);
      return codeFeedback['correct'] != feedback['correct'] ||
          codeFeedback['misplaced'] != feedback['misplaced'];
    });
    guesses.add(currentGuess);
    currentGuess = possibleCodes.first.toList();
    guessCount++;
  }
}
