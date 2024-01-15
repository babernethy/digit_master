import 'package:digit_master/app/services/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_helpers/flutter_helpers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state.freezed.dart';
part 'app_state.g.dart';

@freezed
class AppStateData with _$AppStateData {
  factory AppStateData({
    @Default(false) bool isLoading,
    AppLocalizations? localization,
  }) = _AppStateData;
}

enum SimpleBannerTypeEnum {
  warning('warning.png', Color.fromARGB(255, 255, 255, 200)),
  notification('notification.png', Color.fromARGB(255, 255, 200, 200)),
  information('information.png', Color.fromARGB(255, 200, 200, 255)),
  alert('alert.png', Color.fromARGB(255, 255, 200, 200)),
  check('check.png', Color.fromARGB(255, 200, 255, 200));

  final String iconImageName;
  final Color bannerColor;
  const SimpleBannerTypeEnum(this.iconImageName, this.bannerColor);
}

@riverpod
class AppState extends _$AppState {
  AppStateData? _cachedState;

  @override
  AppStateData build() {
    if (_cachedState == null) {
      ref.read(getLocalizationProvider).loadCurrent().then((value) {
        _cachedState = state.copyWith(localization: value);
        state = _cachedState!;
      });
    }

    return _cachedState ?? AppStateData();
  }

  void setLoading({required bool isLoading}) {
    _cachedState = state.copyWith(isLoading: isLoading);
    state = _cachedState!;
    final l10n = state.localization!;

    showMaterialBanner(
      MaterialBanner(
        padding: const EdgeInsets.all(20),
        content: Text(l10n.appHomeScreenBannerButtonMessage),
        leading: const Icon(Icons.check),
        backgroundColor: Colors.green,
        actions: <Widget>[
          TextButton(
            onPressed: clearAllBanners,
            child: Text(l10n.appHomeScreenBannerDismissLabel),
          ),
          TextButton(
            onPressed: () => showSnackBarMessage(l10n.appHomeScreenHelpMessage),
            child: Text(l10n.appHomeScreenBannerHelpLabel),
          ),
        ],
      ),
    );
  }

  void showSnackBarMessage(String message, {Color? backgroundColor}) {
    final scaffoldKey = ref.watch(scaffoldMessengerKeyProvider);
    final scaffoldMessenger = scaffoldKey.currentState;
    if (scaffoldMessenger != null) {
      scaffoldMessenger.clearSnackBars();
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: backgroundColor,
        ),
      );
    }
  }

  void confirmDeleteBanner(
    String confirmationMessage,
    String confirmationButtonLabel,
    void Function() onConfirm,
  ) {
    final l10n = state.localization!;
    showMaterialBanner(
      MaterialBanner(
        padding: const EdgeInsets.all(20),
        content: Text(confirmationMessage),
        leading: Image.asset(
          'assets/images/icons/delete.png',
          width: 40,
        ),
        backgroundColor: Colors.red.shade100,
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade300,
            ),
            onPressed: clearAllBanners,
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade300,
            ),
            onPressed: () {
              clearAllBanners();
              onConfirm();
            },
            child: Text(confirmationButtonLabel,
                style: const TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }

  void showSimpleBanner(
    SimpleBannerTypeEnum type,
    String message,
  ) {
    final l10n = state.localization!;
    showMaterialBanner(
      MaterialBanner(
        padding: const EdgeInsets.all(20),
        content: Text(message),
        leading: Image.asset(
          'assets/images/icons/${type.iconImageName}',
          width: 40,
        ),
        backgroundColor: type.bannerColor,
        actions: <Widget>[
          ElevatedButton(
            onPressed: clearAllBanners,
            child: const Text("Ok"),
          ),
        ],
      ),
    );
  }

  void clearAllBanners() {
    final scaffoldKey = ref.watch(scaffoldMessengerKeyProvider);
    final scaffoldMessenger = scaffoldKey.currentState;
    if (scaffoldMessenger != null) {
      scaffoldMessenger.clearMaterialBanners();
    }
  }

  void showMaterialBanner(MaterialBanner banner) {
    final scaffoldKey = ref.watch(scaffoldMessengerKeyProvider);
    final scaffoldMessenger = scaffoldKey.currentState;
    if (scaffoldMessenger != null) {
      scaffoldMessenger.clearMaterialBanners();
      scaffoldMessenger.showMaterialBanner(banner);
    }
  }
}

extension AppLocalizationHelper on BuildContext {
  AppLocalizations l10n() => AppLocalizations.of(this)!;
}
