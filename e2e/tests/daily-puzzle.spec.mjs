// E2E: Daily puzzle consistency — same code for the same calendar day.
import { test, expect } from '@playwright/test';
import { waitForFlutterReady, goToTab, screenshot } from './flutter-helpers.mjs';

test.describe('Daily Puzzle Consistency', () => {
  test('same day produces same secret code across reloads', async ({ page }) => {
    // The daily code is seeded by year*10000 + month*100 + day.
    // The secret code is deterministic, but the Five Clues puzzle hints use a
    // shuffled set internally, so screenshot comparison is unreliable for that tab.
    // Instead, verify the console-logged code is identical across reloads.
    const codesFromConsole = [];
    const codeRegex = /^\[(\d, ){3}\d\]$/;

    page.on('console', (msg) => {
      if (codeRegex.test(msg.text())) {
        codesFromConsole.push(msg.text());
      }
    });

    await page.goto('/');
    await waitForFlutterReady(page);
    expect(codesFromConsole.length).toBeGreaterThanOrEqual(1);
    const firstCode = codesFromConsole[codesFromConsole.length - 1];

    // Reload
    await page.reload();
    await waitForFlutterReady(page);
    expect(codesFromConsole.length).toBeGreaterThanOrEqual(2);
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

    // Look for a console log that matches a list of 4 digits, e.g. "[1, 2, 3, 4]"
    const codeLog = consoleLogs.find((log) => /^\[(\d, ){3}\d\]$/.test(log));
    expect(codeLog).toBeDefined();

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
