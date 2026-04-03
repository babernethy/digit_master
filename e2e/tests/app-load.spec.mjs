// E2E: App loads successfully and displays the main game screen.
import { test, expect } from '@playwright/test';
import { waitForFlutterReady, screenshot, expectNonBlank } from './flutter-helpers.mjs';

test.describe('App Load', () => {
  test('app loads and renders non-blank canvas', async ({ page }) => {
    await page.goto('/');
    await waitForFlutterReady(page);

    // The Flutter canvas should exist.
    const canvas = page.locator('canvas');
    await expect(canvas).toBeAttached({ timeout: 10_000 });

    // Screenshot should be non-blank (real content rendered).
    const buffer = await page.screenshot();
    expectNonBlank(buffer);
  });

  test('Flutter engine is initialized', async ({ page }) => {
    await page.goto('/');
    await waitForFlutterReady(page);

    const flutterReady = await page.evaluate(
      () => typeof window._flutter !== 'undefined' || document.querySelector('canvas') !== null,
    );
    expect(flutterReady).toBe(true);
  });

  test('URL uses path strategy (no hash fragment)', async ({ page }) => {
    await page.goto('/');
    await waitForFlutterReady(page);

    // The app uses usePathUrlStrategy() — URL should NOT contain /#/
    expect(page.url()).not.toContain('/#/');
  });
});
