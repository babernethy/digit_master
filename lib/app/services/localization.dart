import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'localization.g.dart';

@riverpod
Localization getLocalization(GetLocalizationRef ref) {
  return Localization();
}

class Localization {
  static final Localization _instance = Localization._internal();
  AppLocalizations? _current;

  factory Localization() => _instance;

  Localization._internal();

  Future<AppLocalizations> loadCurrent() async {
    if (_current == null) {
      final parts = Intl.getCurrentLocale().split('_');
      final locale = Locale(parts.first, parts.last);
      _current = await AppLocalizations.delegate.load(locale);
    }
    return Future.value(_current);
  }

  void invalidate() {
    _current = null;
  }
}
