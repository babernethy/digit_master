import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scaffold_messenger_provider.g.dart';

@riverpod
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey(
  ScaffoldMessengerKeyRef ref,
) {
  return GlobalKey<ScaffoldMessengerState>();
}

@riverpod
ScaffoldMessengerState scaffoldMessenger(ScaffoldMessengerRef ref) {
  return ref.watch(scaffoldMessengerKeyProvider).currentState!;
}
