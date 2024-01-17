import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guess_entry_widget.freezed.dart';
part 'guess_entry_widget.g.dart';

@freezed
class GuessEntryStateData with _$GuessEntryStateData {
  factory GuessEntryStateData({
    @Default([]) List<int> guess,
  }) = _GuessEntryStateData;
}

@riverpod
class GuessEntryState extends _$GuessEntryState {
  GuessEntryStateData? _cachedState;

  @override
  GuessEntryStateData build() {
    return _cachedState ?? GuessEntryStateData();
  }

  void clearGuess() {
    _cachedState = state.copyWith(guess: []);
    state = _cachedState!;
  }

  void addNumberToGuess(int number) {
    final guess = List<int>.from(state.guess);
    guess.add(number);
    _cachedState = state.copyWith(guess: guess);
    state = _cachedState!;
  }

  void removeNumberFromGuess(int number) {
    if (!state.guess.contains(number)) {
      return;
    }
    final guess = List<int>.from(state.guess);
    guess.remove(number);
    _cachedState = state.copyWith(guess: guess);
    state = _cachedState!;
  }

  void removeLastNumberFromGuess() {
    final guess = List<int>.from(state.guess);
    guess.removeLast();
    _cachedState = state.copyWith(guess: guess);
    state = _cachedState!;
  }
}

typedef GuessCallback = void Function(List<int> guess);

class GuessEntryWidget extends ConsumerWidget {
  const GuessEntryWidget({
    this.onGuess,
    super.key,
  });

  final GuessCallback? onGuess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guessEntryState = ref.watch(guessEntryStateProvider);
    final guessEntryActions = ref.watch(guessEntryStateProvider.notifier);
    final currentGuess = guessEntryState.guess;
    final int? firstDigit = currentGuess.length > 0 ? currentGuess[0] : null;
    final int? secondDigit = currentGuess.length > 1 ? currentGuess[1] : null;
    final int? thirdDigit = currentGuess.length > 2 ? currentGuess[2] : null;
    final int? fourthDigit = currentGuess.length > 3 ? currentGuess[3] : null;

    void pressme() {
      onGuess!(currentGuess);
      guessEntryActions.clearGuess();
    }

    return Container(
      width: 400,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            children: [
              Row(
                children: [
                  GuessNumber(guessNumber: firstDigit),
                  GuessNumber(guessNumber: secondDigit),
                  GuessNumber(guessNumber: thirdDigit),
                  GuessNumber(guessNumber: fourthDigit),
                ],
              ),
              ElevatedButton(
                onPressed: (onGuess != null && currentGuess.length == 4)
                    ? pressme
                    : null,
                child: const Text("Submit"),
              ),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(
                    keyNumber: 1,
                    guestEntryState: guessEntryActions,
                    guestEntryStateData: guessEntryState,
                  ),
                  NumberButton(
                    keyNumber: 2,
                    guestEntryState: guessEntryActions,
                    guestEntryStateData: guessEntryState,
                  ),
                  NumberButton(
                    keyNumber: 3,
                    guestEntryState: guessEntryActions,
                    guestEntryStateData: guessEntryState,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(
                    keyNumber: 4,
                    guestEntryState: guessEntryActions,
                    guestEntryStateData: guessEntryState,
                  ),
                  NumberButton(
                    keyNumber: 5,
                    guestEntryState: guessEntryActions,
                    guestEntryStateData: guessEntryState,
                  ),
                  NumberButton(
                    keyNumber: 6,
                    guestEntryState: guessEntryActions,
                    guestEntryStateData: guessEntryState,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberButton(
                    keyNumber: 7,
                    guestEntryState: guessEntryActions,
                    guestEntryStateData: guessEntryState,
                  ),
                  NumberButton(
                    keyNumber: 8,
                    guestEntryState: guessEntryActions,
                    guestEntryStateData: guessEntryState,
                  ),
                  NumberButton(
                    keyNumber: 9,
                    guestEntryState: guessEntryActions,
                    guestEntryStateData: guessEntryState,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClearGuessButton(guessEntryState: guessEntryActions),
                  NumberButton(
                    keyNumber: 0,
                    guestEntryState: guessEntryActions,
                    guestEntryStateData: guessEntryState,
                  ),
                  BackspaceButton(guessEntryState: guessEntryActions),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GuessNumber extends StatelessWidget {
  const GuessNumber({
    super.key,
    this.guessNumber,
  });

  final int? guessNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(2),
      height: 75,
      width: 60,
      color: const Color.fromARGB(255, 7, 2, 146),
      child: Center(
        child: Text(
          guessNumber != null ? guessNumber.toString() : '?',
          style: const TextStyle(
            color: Colors.yellow,
            fontSize: 55,
          ),
        ),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  const NumberButton({
    super.key,
    required this.keyNumber,
    required this.guestEntryState,
    required this.guestEntryStateData,
  });

  final int keyNumber;
  // final bool isEnabled;
  // final Function onPressed;
  final GuessEntryState guestEntryState;
  final GuessEntryStateData guestEntryStateData;

  @override
  Widget build(BuildContext context) {
    final isEnabled = !guestEntryStateData.guess.contains(keyNumber) &&
        guestEntryStateData.guess.length < 4;
    return GestureDetector(
      onTap: () {
        if (isEnabled) {
          guestEntryState.addNumberToGuess(keyNumber);
        } else {
          guestEntryState.removeNumberFromGuess(keyNumber);
        }
      },
      child: Container(
        margin: const EdgeInsets.all(2),
        height: 30,
        width: 24,
        color: isEnabled ? Colors.black : Colors.grey,
        child: Center(
          child: Text(
            keyNumber.toString(),
            style: TextStyle(
              color: guestEntryStateData.guess.contains(keyNumber)
                  ? const Color.fromARGB(255, 7, 2, 146)
                  : Colors.yellow,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class BackspaceButton extends StatelessWidget {
  const BackspaceButton({
    super.key,
    required this.guessEntryState,
  });

  final GuessEntryState guessEntryState;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        guessEntryState.removeLastNumberFromGuess();
      },
      child: Container(
        margin: const EdgeInsets.all(2),
        height: 30,
        width: 24,
        color: Colors.black,
        child: const Center(
          child: Icon(
            Icons.backspace,
            color: Colors.yellow,
            size: 15,
          ),
        ),
      ),
    );
  }
}

class ClearGuessButton extends StatelessWidget {
  const ClearGuessButton({
    super.key,
    required this.guessEntryState,
  });

  final GuessEntryState guessEntryState;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        guessEntryState.clearGuess();
      },
      child: Container(
        margin: const EdgeInsets.all(2),
        height: 30,
        width: 24,
        color: Colors.black,
        child: const Center(
          child: Icon(
            Icons.clear,
            color: Colors.yellow,
            size: 15,
          ),
        ),
      ),
    );
  }
}
