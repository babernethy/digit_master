import 'package:digit_master/app/screens/today.dart';
import 'package:digit_master/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TodayScreen renders three tabs', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: TodayScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Instructions'), findsWidgets);
    expect(find.text('Five Guesses'), findsWidgets);
    expect(find.text('Five Clues'), findsWidgets);
  });

  testWidgets('TodayScreen displays app title', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: TodayScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Digit Master - Crack the Code'), findsOneWidget);
  });
}
