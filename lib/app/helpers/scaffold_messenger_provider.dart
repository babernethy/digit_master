import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scaffold_messenger_provider.g.dart';

@riverpod
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey(
  Ref ref,
) {
  return GlobalKey<ScaffoldMessengerState>();
}

@riverpod
ScaffoldMessengerState scaffoldMessenger(Ref ref) {
  return ref.watch(scaffoldMessengerKeyProvider).currentState!;
}
