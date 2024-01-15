cd ..
flutter create digit_master --platform web
cd digit_master
flutter pub add flex_seed_scheme
flutter pub add freezed_annotation
flutter pub add go_router
flutter pub add google_fonts
flutter pub add hooks_riverpod
flutter pub add json_annotation
flutter pub add riverpod_annotation
flutter pub add flutter_localizations --sdk=flutter
flutter pub add riverpod_lint --dev
flutter pub add custom_lint --dev
flutter pub add go_router_builder --dev
flutter pub add build_runner --dev
flutter pub add freezed --dev
flutter pub add json_serializable --dev
flutter pub add lint --dev
flutter pub add riverpod_generator --dev
dart run build_runner build --delete-conflicting-outputs
dart fix --apply