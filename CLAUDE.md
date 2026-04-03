# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Digit Master is a Flutter web app implementing a Mastermind/code-breaker puzzle game. Players guess a daily 4-digit secret code (unique digits, seed-based per calendar day) in two modes: "Five Guesses" (traditional) and "Five Clues" (one guess with 5 AI-generated hints).

## Build & Development Commands

```bash
# Run (dev)
flutter run -d chrome

# Build for web
flutter build web

# Run tests
flutter test

# Run a single test file
flutter test test/<file>_test.dart

# Code generation (required after changing freezed/riverpod/json/route annotations)
dart run build_runner build --delete-conflicting-outputs

# Analyze
dart analyze

# Auto-fix lint issues
dart fix --apply
```

## Architecture

- **State management**: Riverpod with `@riverpod` annotations and code generation
- **Data models**: Freezed (`@freezed`) for immutable data classes with JSON serialization
- **Routing**: GoRouter with `@TypedGoRoute` code generation via go_router_builder
- **Theming**: Material 3 with flex_seed_scheme seed colors
- **Localization**: Flutter i18n with ARB files in `lib/l10n/`

### Key code paths

- `lib/main.dart` — Entry point: sets up path URL strategy, registers font licenses, wraps app in `ProviderScope`
- `lib/app/app.dart` — `MyApp` ConsumerWidget: MaterialApp.router config, theming, localization
- `lib/app/services/today_state.dart` — Core game logic: secret code generation, guess validation, hint generation, daily seed randomization
- `lib/app/services/code_puzzle.dart` — `CodePuzzle` freezed model
- `lib/app/screens/today.dart` — Main game screen with three tabs (Instructions, Five Guesses, Five Clues)
- `lib/app/router/routes.dart` — Type-safe route definitions

### Generated files (do not edit manually)

- `*.g.dart` — json_serializable / riverpod_generator output
- `*.freezed.dart` — freezed immutable class output
- `lib/l10n/` generated localization files

## Dependencies of Note

- `flutter_helpers` is a custom package loaded from Git (not pub.dev)
- `lint: strict.yaml` is used as the base for analysis_options.yaml

## MCP Server: dgroup-standards

The `dgroup-standards` MCP server is available and **preferred** over reading doc files directly. Use it to look up tasks, standards, and ADRs before coding.

Key tools:
- `list_tasks` / `get_task(number)` / `get_task_context(number)` — locate and fetch task instructions
- `create_task(...)` / `update_task(...)` — create follow-up work and update task status/PR links
- `list_standards` / `get_coding_standards(language)` — fetch Flutter standards
- `list_adrs` / `get_adr(number)` — enumerate and fetch ADR content
- `search_guidelines(query)` — search across ADRs, standards, and templates
- `list_templates` / `get_template(name)` — fetch document templates

When calling `dgroup-standards` tools that accept a `scope` parameter, use `DIGITMASTER` or `DIGITMASTER_WEB` as appropriate.

Use MCP as the source of truth for active task instructions and task status.

## Workflow

- Before coding, use the `dgroup-standards` MCP server to fetch the assigned task, then applicable standards and ADRs.
- Keep Claude worktree branches (`claude/*`, `codex/*`) temporary and local; do not push them as feature branches.
- Use task-scoped feature branches for shipped work (e.g., `feature/DIGIT-TASK-001-new-game-mode`).
