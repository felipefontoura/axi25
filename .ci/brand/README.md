# Brand render sources (dev-only, not shipped)

The AXI25 banner is rendered from an HTML wordmark via headless Chromium: Newsreader serif 500 +
italic amber "25" (`#EDA921` / `#d49311` on paper) + charcoal `#14120f` / paper `#ece7df`.

Fonts (Newsreader, JetBrains Mono; both SIL OFL) load from a local `fonts/` folder next to these
files; download the `.woff2` files from Google Fonts before rendering.

Outputs: `.assets/axi25-banner.png` (light) and `.assets/axi25-banner-dark.png` (dark).
