// @ts-check
import { defineConfig } from '@playwright/test';

export default defineConfig({
  testDir: './tests',
  fullyParallel: false, // Flutter canvas state carries across interactions — run serial
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 1 : 0,
  workers: 1,
  reporter: 'html',
  timeout: 60_000,
  use: {
    baseURL: 'http://localhost:8090',
    viewport: { width: 1080, height: 1024 },
    deviceScaleFactor: 1, // CRITICAL — makes screenshot pixels == CSS pixels
    trace: 'on-first-retry',
    screenshot: 'only-on-failure',
  },
  projects: [
    {
      name: 'chromium',
      use: {
        browserName: 'chromium',
      },
    },
  ],
  webServer: {
    command: 'node serve.mjs',
    port: 8090,
    reuseExistingServer: !process.env.CI,
    timeout: 10_000,
  },
});
