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
    @Default(0) int correct,
    @Default(0) int wellPlaced,
    CodePuzzle? puzzle,
  }) = _TodayStateData;
}

@riverpod
class TodayState extends _$TodayState {
  TodayStateData? _cachedState;

  @override
  TodayStateData build() {
    // if (_cachedState == null) {
    //   updateCode();
    // }
    return _cachedState ?? TodayStateData();
  }

  void increment() {
    if (state.code.isEmpty) {
      updateCode();
    } else {
      updateGuess();
      int count = 0;
      while (count != 6) {
        count = solveMastermind(state.code);
      }
    }
    // _cachedState = state.copyWith(counter: state.counter + 1);
    // state = _cachedState!;
  }

  Future<void> updateCode() async {
    final code = randomCode();

    _cachedState = state.copyWith(code: code);
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

  List<int> randomCode() {
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
      final code =
          i.toString().padLeft(4, '0').split('').map(int.parse).toList();
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

  int solveMastermind(List<int> secretCode) {
    debugPrint('------------------ SOLVING ------------------');
    final Set<List<int>> possibleCodes = generateAllPossibleCodes();
    final List<List<int>> guesses = List<List<int>>.empty(growable: true);
    // List<int> currentGuess = [0, 1, 2, 3];
    // start random - look nicer
    List<int> currentGuess = possibleCodes.first.toList();
    var guessCount = 1;
    while (true) {
      final correct = countMatchingIntegers(secretCode, currentGuess);
      final wellPlaced = countCorrectlyPlacedIntegers(secretCode, currentGuess);
      debugPrint(
          '$guessCount: Secret code: $secretCode - Current guess: $currentGuess - $correct number is correct, $wellPlaced are well placed, possible codes: ${possibleCodes.length}');
      final feedback = getFeedback(secretCode, currentGuess);
      if (feedback['correct'] == 4) {
        if (guessCount == 6) {
          //guesses.removeWhere(currentGuess);
          final puzzle = CodePuzzle(
            code: secretCode,
            hints: guesses,
          );
          _cachedState = state.copyWith(puzzle: puzzle);
          state = _cachedState!;
        }
        return guessCount;
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
}
