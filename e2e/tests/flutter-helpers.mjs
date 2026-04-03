// Shared utilities for Playwright E2E tests against the Digit Master Flutter canvas app.
// Flutter Web renders to <canvas> — there are no DOM elements to query.
// All interaction is via pixel coordinates and keyboard/mouse events.
// Viewport: 1080x1024, deviceScaleFactor: 1 (set in playwright.config.mjs).

// ── Coordinate Map (at 1080×1024, DPR 1) ──────────────────────────
// Derived empirically via screenshot analysis.

export const coords = {
  tabs: {
    instructions: { x: 180, y: 80 },
    fiveGuesses:  { x: 540, y: 80 },
    fiveClues:    { x: 900, y: 80 },
  },
  // Keypad for the initial guess entry (no prior guesses displayed).
  // Each submitted guess shifts subsequent UI down by ~79px.
  keypad: {
    1: { x: 640, y: 187 },
    2: { x: 668, y: 187 },
    3: { x: 696, y: 187 },
    4: { x: 640, y: 221 },
    5: { x: 668, y: 221 },
    6: { x: 696, y: 221 },
    7: { x: 640, y: 255 },
    8: { x: 668, y: 255 },
    9: { x: 696, y: 255 },
    clear: { x: 640, y: 289 },
    0: { x: 668, y: 289 },
    backspace: { x: 696, y: 289 },
  },
  submit: { x: 468, y: 270 },
};

// Vertical shift per submitted guess row (hint row height).
export const GUESS_ROW_HEIGHT = 79;

// ── Helpers ────────────────────────────────────────────────────────

/**
 * Wait for the Flutter engine to initialize and the first frame to paint.
 */
export async function waitForFlutterReady(page) {
  await page.waitForFunction(
    () => typeof window._flutter !== 'undefined' || document.querySelector('canvas') !== null,
    { timeout: 30_000 },
  );
  // Shader compilation + first paint need time.
  await page.waitForTimeout(6000);
}

/**
 * Tap at a canvas coordinate and wait for Flutter to repaint.
 */
export async function tapCanvas(page, x, y, { waitMs = 1200 } = {}) {
  await page.mouse.click(x, y);
  await page.waitForTimeout(waitMs);
}

/**
 * Navigate to a specific tab.
 */
export async function goToTab(page, tabName) {
  const pos = coords.tabs[tabName];
  if (!pos) throw new Error(`Unknown tab: ${tabName}`);
  await tapCanvas(page, pos.x, pos.y);
}

/**
 * Enter a 4-digit guess on the keypad with an offset for prior guess rows.
 * @param {number[]} digits - Array of 4 digits (0-9, unique).
 * @param {number} guessIndex - How many guesses have been submitted (0-based).
 */
export async function enterGuess(page, digits, guessIndex = 0) {
  const yOffset = guessIndex * GUESS_ROW_HEIGHT;
  for (const d of digits) {
    const pos = coords.keypad[d];
    if (!pos) throw new Error(`No keypad position for digit: ${d}`);
    await tapCanvas(page, pos.x, pos.y + yOffset, { waitMs: 400 });
  }
}

/**
 * Click the Submit button with offset for prior guess rows.
 */
export async function submitGuess(page, guessIndex = 0) {
  const yOffset = guessIndex * GUESS_ROW_HEIGHT;
  await tapCanvas(page, coords.submit.x, coords.submit.y + yOffset);
}

/**
 * Enter and submit a full 4-digit guess.
 */
export async function enterAndSubmitGuess(page, digits, guessIndex = 0) {
  await enterGuess(page, digits, guessIndex);
  await submitGuess(page, guessIndex);
}

/**
 * Scroll the canvas and wait for settle.
 */
export async function scrollCanvas(page, deltaY, { x = 540, y = 512 } = {}) {
  await page.mouse.move(x, y);
  await page.mouse.wheel(0, deltaY);
  await page.waitForTimeout(800);
}

/**
 * Capture a named screenshot to test-results/ for debugging.
 */
export async function screenshot(page, name) {
  await page.screenshot({ path: `test-results/${name}.png`, fullPage: false });
}

/**
 * Assert that two screenshot buffers differ (visual change occurred).
 */
export function expectVisualChange(before, after) {
  if (Buffer.compare(before, after) === 0) {
    throw new Error('Expected a visual change but screenshots are identical');
  }
}

/**
 * Assert that a screenshot buffer is non-trivial (not blank).
 */
export function expectNonBlank(buffer, minBytes = 15_000) {
  if (buffer.length < minBytes) {
    throw new Error(`Screenshot looks blank (${buffer.length} bytes < ${minBytes} threshold)`);
  }
}
