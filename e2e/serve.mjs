// Simple static file server for the Flutter web build output.
// Serves build/web/ with SPA fallback (all non-file paths → index.html).

import { createServer } from 'node:http';
import { readFile, stat } from 'node:fs/promises';
import { join, extname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = fileURLToPath(new URL('.', import.meta.url));
const WEB_DIR = join(__dirname, '..', 'build', 'web');
const PORT = 8090;

const MIME = {
  '.html': 'text/html',
  '.js':   'application/javascript',
  '.mjs':  'application/javascript',
  '.css':  'text/css',
  '.json': 'application/json',
  '.png':  'image/png',
  '.jpg':  'image/jpeg',
  '.svg':  'image/svg+xml',
  '.woff': 'font/woff',
  '.woff2': 'font/woff2',
  '.ttf':  'font/ttf',
  '.wasm': 'application/wasm',
};

const server = createServer(async (req, res) => {
  let urlPath = new URL(req.url, `http://localhost:${PORT}`).pathname;
  let filePath = join(WEB_DIR, urlPath);

  // Prevent path traversal — reject requests that escape WEB_DIR.
  const resolved = resolve(filePath);
  if (!resolved.startsWith(WEB_DIR)) {
    res.writeHead(403);
    res.end('Forbidden');
    return;
  }

  try {
    const s = await stat(filePath);
    if (s.isDirectory()) {
      filePath = join(filePath, 'index.html');
    }
    const data = await readFile(filePath);
    const ext = extname(filePath);
    res.writeHead(200, { 'Content-Type': MIME[ext] || 'application/octet-stream' });
    res.end(data);
  } catch {
    // SPA fallback — serve index.html for any path that isn't a real file
    try {
      const data = await readFile(join(WEB_DIR, 'index.html'));
      res.writeHead(200, { 'Content-Type': 'text/html' });
      res.end(data);
    } catch {
      res.writeHead(404);
      res.end('Not found');
    }
  }
});

server.listen(PORT, () => {
  console.log(`Serving Flutter web build at http://localhost:${PORT}`);
});
