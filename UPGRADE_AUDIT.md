# Digit Master — Dependency Upgrade Audit

**Date:** 2026-04-03
**Task:** DIGITMASTER_WEB-TASK-235
**Current Flutter SDK:** 3.41.4 / Dart 3.11.1
**Current SDK constraint:** `>=3.1.0 <4.0.0`

## Package Version Matrix

### Dependencies

| Package | Current Constraint | Latest Stable | Upgrade Type | Breaking? |
|---|---|---|---|---|
| collection | ^1.18.0 | 1.19.1 | minor | No |
| cupertino_icons | ^1.0.2 | 1.0.9 | patch | No |
| flex_seed_scheme | ^1.4.0 | **4.0.1** | **MAJOR (1→4)** | **Yes** |
| freezed_annotation | ^2.4.1 | **3.1.0** | **MAJOR (2→3)** | **Yes** |
| go_router | ^13.0.1 | **17.2.0** | **MAJOR (13→17)** | **Yes** |
| google_fonts | ^6.1.0 | **8.0.2** | **MAJOR (6→8)** | **Yes** |
| hooks_riverpod | ^2.4.9 | **3.3.1** | **MAJOR (2→3)** | **Yes** |
| intl | ^0.18.1 | 0.20.2 | minor | No |
| json_annotation | ^4.8.1 | 4.11.0 | minor | No |
| number_to_words_english | ^2.0.2 | **3.0.4** | **MAJOR (2→3)** | No (backwards compatible) |
| onboarding_overlay | ^3.2.1 | 3.2.3 | patch | No |
| riverpod_annotation | ^2.3.3 | **4.0.2** | **MAJOR (2→4)** | **Yes** |
| flutter_helpers | Git (Bitbucket) | **UNKNOWN — 404** | **BLOCKED** | **See below** |

### Dev Dependencies

| Package | Current Constraint | Latest Stable | Upgrade Type | Breaking? |
|---|---|---|---|---|
| build_runner | ^2.4.8 | 2.13.1 | minor | No |
| custom_lint | ^0.5.8 | 0.8.1 | minor | No |
| freezed | ^2.4.6 | **3.2.5** | **MAJOR (2→3)** | **Yes** |
| go_router_builder | ^2.4.1 | **4.2.1** | **MAJOR (2→4)** | **Yes** |
| json_serializable | ^6.7.1 | 6.13.1 | minor | No |
| lint | ^2.3.0 | 2.8.0 | minor | No |
| riverpod_generator | ^2.3.9 | **4.0.3** | **MAJOR (2→4)** | **Yes** |
| riverpod_lint | ^2.3.7 | **3.1.3** | **MAJOR (2→3)** | **Yes** |

---

## Breaking Change Details

### 1. Freezed 2.x → 3.x (HIGH RISK)

**Key breaking changes:**
- **`map`/`when` methods removed.** Must migrate to Dart pattern matching (`switch`/`case`).
- **Classes must be declared `abstract`, `sealed`, or implement `_$MyClass` explicitly.**
- **Inheritance requires explicit `MyClass._()` private constructor** when using `extends`/`with`.

**Migration effort:** Medium — depends on how many `when`/`map` calls exist in the codebase. Need to audit usage of these methods on `CodePuzzle` and any other freezed models.

**Min SDK:** Dart 3.8

### 2. Riverpod 2.x → 3.x (HIGH RISK)

**Key breaking changes:**
- **Legacy providers moved:** `ChangeNotifierProvider`, `StateProvider`, `StateNotifierProvider` moved to `package:hooks_riverpod/legacy.dart`.
- **Ref subclasses removed:** All typed Ref subclasses (e.g., `FutureProviderRef`) removed. Use plain `Ref` directly.
- **Provider syntax simplified:** `Provider.autoDispose()` → `Provider(isAutoDispose: true)`.
- **AsyncValue.value now returns null during errors** (instead of throwing).
- **Notifiers are recreated on every provider rebuild** — affects state persistence assumptions.
- **StreamProvider pauses when not listened.**

**Migration effort:** Medium-High — need to update all provider definitions, Ref types in generated code, and verify AsyncValue handling throughout the UI.

**Min SDK:** Dart 3.7

### 3. GoRouter 13.x → 17.x (MEDIUM RISK)

**Key breaking changes:**
- **v15: URLs are now case-sensitive** (new default `caseSensitive: true`).
- **v16: Case-sensitive URL handling** — `/Home` and `/home` are now distinct routes. Requires `go_router_builder >= 3.0.0`.
- **v17: ShellRoute observer notifications changed** — shell route navigating changes now notify GoRouter's observers by default.
- **go_router_builder 3.0+: Route classes require `with _$RouteName` mixin.**

**Migration effort:** Medium — need to add mixins to route classes, verify case-sensitivity doesn't break any routes, and update go_router_builder generated code.

**Min SDK:** Dart 3.9

### 4. flex_seed_scheme 1.x → 4.x (MEDIUM RISK)

**Key breaking changes:**
- **Deprecated colors removed:** `background`, `onBackground`, `surfaceVariant` replaced with `surface`, `onSurface`, `surfaceContainerLowest`.
- **`customErrorPalette` renamed to `errorPalette`.**
- **`useExpressiveOnContainerColors` defaults to `true`** — changes on-container colors from tone 10 to tone 30. May affect visual appearance.

**Migration effort:** Low-Medium — search for deprecated color references and update. Visual review of theming needed.

**Min SDK:** Flutter 3.38.0 / Dart 3.6

### 5. google_fonts 6.x → 8.x (LOW-MEDIUM RISK)

**Migration effort:** Low — typically API-compatible between major versions. Verify font loading and license registration still works.

### 6. flutter_helpers — Git dependency (CRITICAL BLOCKER)

**The Bitbucket URL returns 404:** `https://bitbucket.org/magicwrighter/flutter-helpers/src/master/lib/flutter_helpers.dart`

**Options:**
1. Check if the repo was moved or renamed on Bitbucket
2. Check if a local/cached copy exists and vendor it into the project
3. Replace its functionality with direct implementations or alternative packages
4. Check `pubspec.lock` for the actual resolved git hash — it may still be cached locally

**This must be resolved in TASK-236 before any other upgrades can proceed.**

---

## Non-Breaking Upgrades (Safe batch for TASK-237)

These packages have only patch/minor bumps and should upgrade cleanly:

| Package | From | To |
|---|---|---|
| collection | ^1.18.0 | ^1.19.0 |
| cupertino_icons | ^1.0.2 | ^1.0.9 |
| intl | ^0.18.1 | ^0.20.0 |
| json_annotation | ^4.8.1 | ^4.11.0 |
| number_to_words_english | ^2.0.2 | ^3.0.0 (backwards compatible) |
| onboarding_overlay | ^3.2.1 | ^3.2.3 |
| build_runner | ^2.4.8 | ^2.13.0 |
| custom_lint | ^0.5.8 | ^0.8.0 |
| json_serializable | ^6.7.1 | ^6.13.0 |
| lint | ^2.3.0 | ^2.8.0 |

---

## Recommended Upgrade Order

This confirms the epic structure in TASK-234:

1. **TASK-236 — SDK constraints + flutter_helpers resolution** (CRITICAL PATH)
   - Update SDK constraint to `>=3.11.0 <4.0.0`
   - Resolve the flutter_helpers 404 blocker
   - Get `flutter pub get` working

2. **TASK-237 — Non-breaking patch/minor upgrades**
   - Safe batch listed above
   - Validate with analyze + test + build

3. **TASK-238 — Freezed 2→3 + json_serializable**
   - Migrate class declarations to `sealed`/`abstract`
   - Replace `when`/`map` with Dart pattern matching
   - Regenerate all `.freezed.dart` files

4. **TASK-239 — Riverpod 2→3**
   - Update all Ref types to plain `Ref`
   - Move any legacy providers to `legacy.dart` imports
   - Update AsyncValue handling
   - Regenerate all `.g.dart` provider files

5. **TASK-240 — GoRouter 13→17 + go_router_builder 2→4**
   - Add `with _$RouteName` mixins to route classes
   - Verify case-sensitive URL handling
   - Regenerate route files

6. **TASK-241 — flex_seed_scheme 1→4, google_fonts 6→8, remaining**
   - Update deprecated color references
   - Review theming visually
   - Verify font loading

7. **TASK-242 — Final validation**
   - Clean regeneration of all generated files
   - Full test suite + build + smoke test
   - Version bump

---

## Risk Assessment

| Risk | Severity | Mitigation |
|---|---|---|
| flutter_helpers Git URL 404 | **Critical** | Must resolve before any upgrades. Check pubspec.lock for cached hash; may need to vendor or replace. |
| Freezed `when`/`map` removal | High | Audit all usage sites before upgrading. Migrate to Dart pattern matching. |
| Riverpod Ref type changes | High | Generated code will handle most of it, but manual provider definitions need updating. |
| flex_seed_scheme visual changes | Medium | `useExpressiveOnContainerColors` default change may alter app appearance. Set explicitly to `false` if needed. |
| GoRouter case-sensitivity | Low | Digit Master likely uses consistent lowercase routes, but verify. |
| intl minor bump | Low | May affect localization ARB processing — test l10n output. |

---

## Alignment with Coding Standards

The `dgroup-standards` Flutter coding standards already reference the target versions:
- `flutter_riverpod: ^3.1.0`, `riverpod_annotation: ^4.0.0`, `riverpod_generator: ^4.0.0`
- `freezed: ^3.2.0`, `freezed_annotation: ^3.1.0`
- `go_router: ^17.0.0`, `google_fonts: ^8.0.0`
- `json_serializable: ^6.11.0`, `build_runner: ^2.11.0`

This upgrade will bring Digit Master into alignment with the org-wide standards.
