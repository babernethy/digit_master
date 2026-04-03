// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appHomeScreenName => 'Home';

  @override
  String get appHomeScreenButtonMessage => 'You are already home';

  @override
  String get appHomeScreenBannerButtonMessage => 'This is a banner';

  @override
  String get appHomeScreenBannerDismissLabel => 'Dismiss';

  @override
  String get appHomeScreenHelpMessage => 'How can I help you?';

  @override
  String get appHomeScreenBannerHelpLabel => 'Help';

  @override
  String get appTodayScreenName => 'today';
}
