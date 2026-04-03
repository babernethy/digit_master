// E2E: Five Guesses mode — enter guesses, see feedback, handle invalid input.
import { test } from '@playwright/test';
import {
  waitForFlutterReady,
  goToTab,
  enterAndSubmitGuess,
  screenshot,
  expectVisualChange,
  coords,
  tapCanvas,
} from './flutter-helpers.mjs';

test.describe('Five Guesses Mode', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
    await waitForFlutterReady(page);
    await goToTab(page, 'fiveGuesses');
  });

  test('can enter a 4-digit guess and see feedback', async ({ page }) => {
    const before = await page.screenshot();

    // Enter guess: 1, 2, 3, 4
    await enterAndSubmitGuess(page, [1, 2, 3, 4], 0);

    const after = await page.screenshot();
    expectVisualChange(before, after);
    await screenshot(page, 'guess-1234-feedback');
  });

  test('can enter multiple guesses sequentially', async ({ page }) => {
    // First guess
    await enterAndSubmitGuess(page, [1, 2, 3, 4], 0);
    const afterFirst = await page.screenshot();

    // Second guess — UI shifted down by one guess row
    await enterAndSubmitGuess(page, [5, 6, 7, 8], 1);
    const afterSecond = await page.screenshot();

    expectVisualChange(afterFirst, afterSecond);
    await screenshot(page, 'two-guesses-submitted');
  });

  test('duplicate digit is handled (toggled off)', async ({ page }) => {
    // Enter digit 1
    await tapCanvas(page, coords.keypad[1].x, coords.keypad[1].y, { waitMs: 400 });
    const afterOne = await page.screenshot();

    // Try to enter digit 1 again — should toggle it off (remove from guess)
    await tapCanvas(page, coords.keypad[1].x, coords.keypad[1].y, { waitMs: 400 });
    const afterToggle = await page.screenshot();

    // The guess should have changed (1 removed).
    expectVisualChange(afterOne, afterToggle);
    await screenshot(page, 'duplicate-digit-toggled');
  });

  test('clear button resets the current guess', async ({ page }) => {
    // Enter two digits
    await tapCanvas(page, coords.keypad[1].x, coords.keypad[1].y, { waitMs: 300 });
    await tapCanvas(page, coords.keypad[2].x, coords.keypad[2].y, { waitMs: 300 });
    const beforeClear = await page.screenshot();

    // Clear
    await tapCanvas(page, coords.keypad.clear.x, coords.keypad.clear.y, { waitMs: 500 });
    const afterClear = await page.screenshot();

    expectVisualChange(beforeClear, afterClear);
    await screenshot(page, 'after-clear');
  });

  test('backspace removes the last digit', async ({ page }) => {
    // Enter 1, 2
    await tapCanvas(page, coords.keypad[1].x, coords.keypad[1].y, { waitMs: 300 });
    await tapCanvas(page, coords.keypad[2].x, coords.keypad[2].y, { waitMs: 300 });
    const beforeBackspace = await page.screenshot();

    // Backspace
    await tapCanvas(page, coords.keypad.backspace.x, coords.keypad.backspace.y, { waitMs: 500 });
    const afterBackspace = await page.screenshot();

    expectVisualChange(beforeBackspace, afterBackspace);
    await screenshot(page, 'after-backspace');
  });
});
