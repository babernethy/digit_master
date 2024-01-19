import 'package:digit_master/app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_helpers/flutter_helpers.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onboarding_overlay/onboarding_overlay.dart';

// Define your seed colors.
const Color primarySeedColor = Colors.lightBlue;
const Color secondarySeedColor = Colors.yellow;
const Color tertiarySeedColor = Color.fromARGB(255, 7, 2, 146);

final List<FocusNode> overlayKeys = <FocusNode>[
  FocusNode(),
  FocusNode(),
  FocusNode(),
];

class MyApp extends ConsumerWidget {
  final GlobalKey<OnboardingState> onboardingKey = GlobalKey<OnboardingState>();

  MyApp({super.key});

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
