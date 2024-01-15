import 'package:digit_master/app/screens/hint_widget.dart';
import 'package:digit_master/app/services/code_puzzle.dart';
import 'package:flutter/material.dart';

class PuzzleWidget extends StatelessWidget {
  const PuzzleWidget({
    super.key,
    required this.puzzle,
  });

  final CodePuzzle puzzle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.lightBlue,
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: puzzle.hints
                  .map(
                    (e) => HintWidget(
                      guess: e,
                      code: puzzle.code,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
