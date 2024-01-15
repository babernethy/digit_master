import 'package:digit_master/app/app.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  usePathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}
