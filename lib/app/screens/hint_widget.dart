import 'package:flutter/material.dart';
import 'package:number_to_words_english/number_to_words_english.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class HintWidget extends StatelessWidget {
  const HintWidget({
    super.key,
    required this.guess,
    required this.code,
  });

  final List<int> guess;
  final List<int> code;

  int correct() {
    return guess.where((element) => code.contains(element)).length;
  }

  int wellPlaced() {
    int count = 0;
    for (int i = 0; i < code.length; i++) {
      if (code[i] == guess[i]) {
        count++;
      }
    }
    return count;
  }

  String hint() {
    final wellPlaced = this.wellPlaced();
    final correct = this.correct();
    final incorrect = correct - wellPlaced;
    ;
    var hint = "";
    if (wellPlaced == 0 && correct == 0) {
      return "Nothing is correct";
    }

    hint += "${headerByNumber(correct).capitalize()} correct";

    if (wellPlaced == 0) {
      hint += ",\nbut wrongly placed";
    } else if (correct == wellPlaced) {
      hint += ",\nand well placed";
    } else {
      if (correct > 0) {
        hint += ",\n${headerByNumber(wellPlaced)} correctly placed";
      }
      if (incorrect > 0) {
        hint += ",\n${headerByNumber(incorrect)} wrongly placed";
      }
    }

    // if (correct == 0) {
    //   hint += "No numbers are correct,";
    // } else if (correct == 1) {
    //   hint = "One number is correct,";
    // } else if (correct > 1) {
    //   hint = "${NumberToWordsEnglish.convert(correct)} numbers are correct,";
    // }

    // if (wellPlaced == 0) {
    //   hint += " None are well placed";
    // } else if (wellPlaced == 1) {
    //   hint += " One number is well placed";
    // } else if (wellPlaced > 1) {
    //   hint += " ${NumberToWordsEnglish.convert(wellPlaced)} are well placed.";
    // }

    // hint += "\n ${code.toString()}";

    return hint;
  }

  String headerByNumber(int number) {
    switch (number) {
      case 0:
        return "no numbers are";
      case 1:
        return "one number is";
      default:
        return "${NumberToWordsEnglish.convert(number)} numbers are";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //const Text("guess"),
        ...guess.map(
          (int i) => Container(
            margin: const EdgeInsets.all(2),
            height: 75,
            width: 60,
            color: Colors.black,
            //padding: const EdgeInsets.all(2),
            child: Center(
              child: Text(
                i.toString(),
                style: const TextStyle(
                  color: Colors.yellow,
                  fontSize: 55,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 350,
          padding: const EdgeInsets.all(10),
          child:
              Text(hint(), style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}