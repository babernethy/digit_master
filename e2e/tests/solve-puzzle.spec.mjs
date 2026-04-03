// E2E: Solve the puzzle — read the secret code from console and enter the winning guess.
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

// Five Clues keypad is shifted down below the 5 hint rows.
const CLUES_KEYPAD_Y_OFFSET = 430;
const clueKeypad = (digit) => {
  const base = coords.keypad[digit];
  return { x: base.x, y: base.y + CLUES_KEYPAD_Y_OFFSET };
};
const clueSubmit = { x: coords.submit.x, y: coords.submit.y + CLUES_KEYPAD_Y_OFFSET };

test.describe('Solve the Puzzle', () => {
  test('crack the code in Five Guesses mode', async ({ page }) => {
    // Capture the secret code from console output.
    let secretCode = null;
    const codeRegex = /^\[(\d, ){3}\d\]$/;
    page.on('console', (msg) => {
      if (!secretCode && codeRegex.test(msg.text())) {
        secretCode = msg.text().match(/\d/g).map(Number);
      }
    });

    await page.goto('/');
    await waitForFlutterReady(page);

    // Navigate to Five Guesses.
    await goToTab(page, 'fiveGuesses');
    await page.waitForTimeout(1000);

    // First, enter a wrong guess so we can see feedback.
    // Pick 4 digits that are NOT in the secret code.
    const allDigits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    const wrongDigits = allDigits.filter((d) => !secretCode.includes(d)).slice(0, 4);
    await enterAndSubmitGuess(page, wrongDigits, 0);
    await screenshot(page, 'solve-wrong-guess');

    // Now enter the correct code!
    await enterAndSubmitGuess(page, secretCode, 1);
    await page.waitForTimeout(2000); // Let the win animation settle.
    await screenshot(page, 'solve-winner');
  });

  test('crack the code in Five Clues mode', async ({ page }) => {
    let secretCode = null;
    const codeRegex = /^\[(\d, ){3}\d\]$/;
    page.on('console', (msg) => {
      if (!secretCode && codeRegex.test(msg.text())) {
        secretCode = msg.text().match(/\d/g).map(Number);
      }
    });

    await page.goto('/');
    await waitForFlutterReady(page);

    await goToTab(page, 'fiveClues');
    await page.waitForTimeout(4000); // Wait for puzzle generation.
    await screenshot(page, 'solve-clues-before');

    // Scroll down to the guess entry.
    await page.mouse.move(540, 500);
    await page.mouse.wheel(0, 350);
    await page.waitForTimeout(800);

    // Enter the winning code.
    for (const d of secretCode) {
      await tapCanvas(page, clueKeypad(d).x, clueKeypad(d).y, { waitMs: 600 });
    }
    await screenshot(page, 'solve-clues-entered');

    // Submit.
    await tapCanvas(page, clueSubmit.x, clueSubmit.y);
    await page.waitForTimeout(2000);
    await screenshot(page, 'solve-clues-winner');
  });
});
