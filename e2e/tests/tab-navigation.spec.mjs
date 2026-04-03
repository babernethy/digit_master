// E2E: Tab navigation — Instructions, Five Guesses, Five Clues.
import { test } from '@playwright/test';
import {
  waitForFlutterReady,
  goToTab,
  screenshot,
  expectVisualChange,
} from './flutter-helpers.mjs';

test.describe('Tab Navigation', () => {
  test('Instructions tab is visible on load', async ({ page }) => {
    await page.goto('/');
    await waitForFlutterReady(page);

    const instructionsScreen = await page.screenshot();

    // Navigate away and back to confirm it's the initial view.
    await goToTab(page, 'fiveGuesses');
    const guessesScreen = await page.screenshot();
    expectVisualChange(instructionsScreen, guessesScreen);

    await goToTab(page, 'instructions');
    const backToInstructions = await page.screenshot();
    // Verify we left the Guesses tab (view changed back).
    expectVisualChange(guessesScreen, backToInstructions);
  });

  test('can navigate to Five Guesses tab', async ({ page }) => {
    await page.goto('/');
    await waitForFlutterReady(page);

    const before = await page.screenshot();
    await goToTab(page, 'fiveGuesses');
    const after = await page.screenshot();

    expectVisualChange(before, after);
    await screenshot(page, 'nav-five-guesses');
  });

  test('can navigate to Five Clues tab', async ({ page }) => {
    await page.goto('/');
    await waitForFlutterReady(page);

    const before = await page.screenshot();
    await goToTab(page, 'fiveClues');
    // Extra wait for puzzle generation (async provider).
    await page.waitForTimeout(3000);
    const after = await page.screenshot();

    expectVisualChange(before, after);
    await screenshot(page, 'nav-five-clues');
  });

  test('can cycle through all three tabs', async ({ page }) => {
    await page.goto('/');
    await waitForFlutterReady(page);

    const s1 = await page.screenshot();

    await goToTab(page, 'fiveGuesses');
    const s2 = await page.screenshot();
    expectVisualChange(s1, s2);

    await goToTab(page, 'fiveClues');
    await page.waitForTimeout(3000);
    const s3 = await page.screenshot();
    expectVisualChange(s2, s3);

    await goToTab(page, 'instructions');
    const s4 = await page.screenshot();
    expectVisualChange(s3, s4);
  });
});
