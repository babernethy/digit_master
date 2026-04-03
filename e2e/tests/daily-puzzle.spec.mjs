// E2E: Daily puzzle consistency — same code for the same calendar day.
import { test, expect } from '@playwright/test';
import { waitForFlutterReady, goToTab } from './flutter-helpers.mjs';

const CODE_REGEX = /^\[(\d, ){3}\d\]$/;

test.describe('Daily Puzzle Consistency', () => {
  test('same day produces same secret code across reloads', async ({ page }) => {
    // The daily code is seeded by year*10000 + month*100 + day.
    // The secret code is deterministic, but the Five Clues puzzle hints use a
    // shuffled set internally, so screenshot comparison is unreliable for that tab.
    // Instead, verify the console-logged code is identical across reloads.
    const codesFromConsole = [];

    page.on('console', (msg) => {
      if (CODE_REGEX.test(msg.text())) {
        codesFromConsole.push(msg.text());
      }
    });

    await page.goto('/');
    await waitForFlutterReady(page);
    // The 6-second waitForFlutterReady is sufficient for the console log to arrive.
    expect(codesFromConsole.length, 'First code should be logged').toBeGreaterThanOrEqual(1);
    const firstCode = codesFromConsole[codesFromConsole.length - 1];

    // Reload
    await page.reload();
    await waitForFlutterReady(page);
    expect(codesFromConsole.length, 'Second code should be logged').toBeGreaterThanOrEqual(2);
    const secondCode = codesFromConsole[codesFromConsole.length - 1];

    // Same daily code.
    expect(firstCode).toBe(secondCode);
  });

  test('Five Guesses initial state is consistent across reloads', async ({ page }) => {
    await page.goto('/');
    await waitForFlutterReady(page);
    await goToTab(page, 'fiveGuesses');
    const firstLoad = await page.screenshot();

    await page.reload();
    await waitForFlutterReady(page);
    await goToTab(page, 'fiveGuesses');
    const secondLoad = await page.screenshot();

    expect(Buffer.compare(firstLoad, secondLoad)).toBe(0);
  });

  test('app prints secret code to console (seed-based)', async ({ page }) => {
    // The app calls print(code) in today_state.dart build().
    // Capture console output to verify the code is a list of 4 unique digits.
    const consoleLogs = [];
    page.on('console', (msg) => {
      consoleLogs.push(msg.text());
    });

    await page.goto('/');
    await waitForFlutterReady(page);

    const codeLog = consoleLogs.find((log) => CODE_REGEX.test(log));
    expect(codeLog, 'Secret code should appear in console output').toBeDefined();

    // Parse the code and verify uniqueness.
    const digits = codeLog.match(/\d/g).map(Number);
    expect(digits).toHaveLength(4);
    expect(new Set(digits).size).toBe(4);
    // All digits 0-9.
    for (const d of digits) {
      expect(d).toBeGreaterThanOrEqual(0);
      expect(d).toBeLessThanOrEqual(9);
    }
  });
});
