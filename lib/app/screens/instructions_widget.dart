// ignore_for_file: require_trailing_commas

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstructionsWidget extends StatelessWidget {
  const InstructionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle =
        GoogleFonts.tekoTextTheme().displayLarge?.copyWith(fontSize: 22);
    const TextStyle(color: Colors.yellow);
    final titleTextStyle = GoogleFonts.cinzelDecorativeTextTheme()
        .headlineLarge
        ?.copyWith(color: Colors.white, fontSize: 32);
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      width: 600,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Crack the Code Instructions',
              style: titleTextStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('The computer has created a secret code.', style: textStyle),
            const SizedBox(
              height: 10,
            ),
            Text(
              'There is a new code for today ${DateTime.now().toIso8601String().substring(0, 10)}.',
              style: textStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('There are two ways to crack the code.', style: textStyle),
            const SizedBox(
              height: 15,
            ),

            Text(
              'Five Clues',
              style: titleTextStyle,
            ),
            Text(
                'The computer will give you 5 Clues to help you crack the code, but you have only One Guess.',
                style: textStyle),
            const SizedBox(
              height: 15,
            ),

            Text(
              'Five Guesses',
              style: titleTextStyle,
            ),
            Text(
                'Try to guess the code, starting with Nothing, in 5 Guesses (or as few as possible).',
                style: textStyle),
            const SizedBox(
              height: 10,
            ),

            Text('The code is made up of 4 unique numbers between 0 and 9.',
                style: textStyle),
            const SizedBox(
              height: 10,
            ),

            //const Text('You have 5 guesses to crack the code.'),
            Text('After each guess, the computer will give you clues.',
                style: textStyle),
            const SizedBox(
              height: 15,
            ),

            Text('The clues will tell you how many numbers are correct,',
                style: textStyle),

            Text(
                'and how many numbers are well placed in their position in the code.',
                style: textStyle),
            const SizedBox(
              height: 15,
            ),

            Text('For example, if the code is 1234, and you guess 5678,',
                style: textStyle),
            Text(
                'the computer will tell you that you have 0 correct, and 0 well placed.',
                style: textStyle),
            Text(
                'If you guess 5671, the computer will tell you that you have 1 correct, and 0 well placed.',
                style: textStyle),
            Text(
                'If you guess 1562, the computer will tell you that you have 2 correct, and 1 well placed.',
                style: textStyle),

            const SizedBox(
              height: 10,
            ),

            Text(
              'Good Luck',
              style: titleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
