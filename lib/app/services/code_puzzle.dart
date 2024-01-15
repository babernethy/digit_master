import 'package:freezed_annotation/freezed_annotation.dart';

part 'code_puzzle.freezed.dart';

@freezed
class CodePuzzle with _$CodePuzzle {
  factory CodePuzzle({
    required List<int> code,
    required List<List<int>> hints,
  }) = _CodePuzzle;
}
