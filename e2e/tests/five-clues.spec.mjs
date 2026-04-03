// E2E: Five Clues mode — see hints, enter a final guess.
import { test } from '@playwright/test';
import {
  waitForFlutterReady,
  goToTab,
  screenshot,
  expectVisualChange,
  expectNonBlank,
  coords,
  tapCanvas,
} from './flutter-helpers.mjs';

// Five Clues tab has a different layout: 5 hint rows at top, then guess entry below.
// The guess entry keypad is shifted down because the puzzle hints take significant space.
// Empirically, the Five Clues keypad is roughly 400px lower than the Five Guesses keypad.
const CLUES_KEYPAD_Y_OFFSET = 430;

const clueKeypad = (digit) => {
  const base = coords.keypad[digit];
  return { x: base.x, y: base.y + CLUES_KEYPAD_Y_OFFSET };
};

const clueSubmit = { x: coords.submit.x, y: coords.submit.y + CLUES_KEYPAD_Y_OFFSET };

test.describe('Five Clues Mode', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto('/');
    await waitForFlutterReady(page);
    await goToTab(page, 'fiveClues');
    // Extra wait for the async puzzle generation.
    await page.waitForTimeout(4000);
  });

  test('Five Clues tab displays hint content', async ({ page }) => {
    const buffer = await page.screenshot();
    // The Five Clues screen should be non-blank and show puzzle hints.
    expectNonBlank(buffer);
    await screenshot(page, 'five-clues-hints');
  });

  test('Five Clues screen is visually different from Five Guesses', async ({ page }) => {
    const cluesScreen = await page.screenshot();

    await goToTab(page, 'fiveGuesses');
    const guessesScreen = await page.screenshot();

    expectVisualChange(cluesScreen, guessesScreen);
  });

  test('can enter a guess in Five Clues mode', async ({ page }) => {
    const before = await page.screenshot();

    // Scroll down to reach the guess entry area below the 5 hints.
    await page.mouse.move(540, 500);
    await page.mouse.wheel(0, 350);
    await page.waitForTimeout(800);

    // Enter digits on the Five Clues keypad.
    await tapCanvas(page, clueKeypad(1).x, clueKeypad(1).y, { waitMs: 400 });
    await tapCanvas(page, clueKeypad(2).x, clueKeypad(2).y, { waitMs: 400 });
    await tapCanvas(page, clueKeypad(3).x, clueKeypad(3).y, { waitMs: 400 });
    await tapCanvas(page, clueKeypad(4).x, clueKeypad(4).y, { waitMs: 400 });

    const afterEntry = await page.screenshot();
    expectVisualChange(before, afterEntry);
    await screenshot(page, 'five-clues-guess-entered');

    // Submit
    await tapCanvas(page, clueSubmit.x, clueSubmit.y);

    const afterSubmit = await page.screenshot();
    expectVisualChange(afterEntry, afterSubmit);
    await screenshot(page, 'five-clues-after-submit');
  });
});
