import 'package:digit_master/app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_helpers/flutter_helpers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Define your seed colors.
const Color primarySeedColor = Color(0xFF6750A4);
const Color secondarySeedColor = Color(0xFF3871BB);
const Color tertiarySeedColor = Color(0xFF6CA450);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme =
        GoogleFonts.notoSansDisplayTextTheme(Theme.of(context).textTheme);
    return MaterialApp.router(
      title: 'Digit Master',
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
      routerConfig: ref.watch(routerProvider),
      themeMode: ThemeMode.light,
      theme: ThemeData.from(
        colorScheme: schemeLight(
          primarySeedColor: primarySeedColor,
          secondarySeedColor: secondarySeedColor,
          tertiarySeedColor: tertiarySeedColor,
          keepAllOnColorsBW: true,
        ),
        useMaterial3: true,
        textTheme: textTheme,
      ),
      darkTheme: ThemeData.from(
        colorScheme: schemeDark(
          primarySeedColor: primarySeedColor,
          secondarySeedColor: secondarySeedColor,
          tertiarySeedColor: tertiarySeedColor,
          keepAllOnColorsBW: true,
        ),
        useMaterial3: true,
        textTheme: textTheme,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        //Locale('es'), // Spanish
      ],
    );
  }
}
