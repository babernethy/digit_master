# Digit Master — Playwright E2E Tests

End-to-end tests for the Digit Master Flutter web app using [Playwright](https://playwright.dev/).

## How it works

Flutter Web renders to a `<canvas>` — there are no DOM elements for Playwright to query. These tests use **coordinate-based visual hit testing** per [ADR-048](https://github.com/babernethy/dgroup-standards):

- Lock the viewport to `1080×1024` with `deviceScaleFactor: 1`
- Interact via pixel coordinates (`page.mouse.click(x, y)`)
- Assert via screenshot comparison and console output

## Prerequisites

1. **Flutter web build** — the tests run against a pre-built `build/web/` directory:
   ```bash
   cd ..  # project root
   flutter build web
   ```

2. **Node.js** — any recent LTS version (18+).

3. **Playwright Chromium**:
   ```bash
   cd e2e
   npm install
   npx playwright install chromium
   ```

## Running tests

```bash
cd e2e

# Headless (CI-compatible)
npm test

# Headed (watch the browser)
npm run test:headed

# Debug with Playwright inspector
npm run test:debug
```

The `webServer` config in `playwright.config.mjs` auto-starts a static server on port 8090 serving `build/web/`.

## Test structure

| Spec file | What it covers |
|-----------|---------------|
| `app-load.spec.mjs` | Canvas renders, Flutter engine initializes, path URL strategy |
| `tab-navigation.spec.mjs` | Navigate between Instructions / Five Guesses / Five Clues tabs |
| `five-guesses.spec.mjs` | Enter guesses, see feedback, clear, backspace, duplicate handling |
| `five-clues.spec.mjs` | View 5 hints, enter a single guess, see result |
| `daily-puzzle.spec.mjs` | Daily seed determinism, console-logged code validation |

## Coordinate map

Coordinates are defined in `tests/flutter-helpers.mjs`. If the UI layout changes, run tests with `npm run test:headed` and use DevTools / screenshots to recalibrate.

## Updating coordinates after UI changes

1. Run `npm run test:headed` to see where clicks land
2. Add `await screenshot(page, 'debug-name')` calls to capture PNGs in `test-results/`
3. Update the `coords` object in `flutter-helpers.mjs`
