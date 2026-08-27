# Creekstone Retrievers — website

A rebuild of [creekstoneretrievers.com](https://www.creekstoneretrievers.com/) as a
fast, mobile-first static site. Golden Retriever breeder in Morris, Alabama,
family owned since 1985.

## Status

All six pages are built with the site's real content and a warm farm theme.
**The photographs are still placeholders** — see "Swapping in the real photos"
below, and `BUILD_PROMPT.md` for the full spec and open items.

## Running it

It is plain static HTML — open `index.html` in a browser, or serve the folder:

```sh
python3 -m http.server 8000
```

To deploy, upload the repository root as-is. There is no build step and no
server-side code.

## Layout

```
index.html                 Home
about-us.html              About
available-litters.html     Available Litters
upcoming-litters.html      Upcoming Litters
directions.html            Directions
contact-us.html            Contact

home.html                  → redirects to index.html          (legacy URL)
lost---found.html          → redirects to directions.html     (legacy URL)

assets/css/site.css        All styling; the palette lives in the :root block
assets/js/site.js          Mobile navigation toggle
assets/img/placeholders/   Temporary images, one per real photograph

tools/partials/            Shared header and footer
tools/pages/               Per-page body content
tools/build.sh             Reassembles the .html files from the above
```

The two legacy filenames are kept so links and search results pointing at the
old site keep working.

## Editing

For a small copy change, edit the `.html` file directly.

To change the **header, footer, or navigation** — anything shared across pages —
edit `tools/partials/` and regenerate so every page stays in sync:

```sh
bash tools/build.sh
```

`tools/build.sh` overwrites the six page files from `tools/partials/` +
`tools/pages/`, so any direct edit to a page body should be mirrored back into
`tools/pages/` or it will be lost on the next run.

## Theme

Colors and fonts are CSS custom properties at the top of `assets/css/site.css`.
Retune the palette there and the whole site follows:

| Token | Use |
|-------|-----|
| `--cream`, `--cream-deep` | page and band backgrounds |
| `--gold`, `--gold-light`, `--gold-wash` | accents, buttons, highlight bands |
| `--brown`, `--brown-soft` | body text |
| `--green`, `--green-soft` | headings and the dark call-to-action bands |

Headings use Bitter, body text uses Source Sans 3, both from Google Fonts with
system-serif and system-sans fallbacks declared.

## Swapping in the real photos

Each file in `assets/img/placeholders/` stands in for one real photograph and is
named for it (`farm-lake`, `puppies-indoor`, `pond-play`, `wooded-path`,
`litter-01`…, `puppy-01`…, `hero`).

1. Drop the real photos into `assets/img/` — keep the same base names.
2. Update the `src` and the `width`/`height` attributes in `tools/pages/*.body.html`.
3. Replace the placeholder alt text with a real description of each photo.
4. Run `bash tools/build.sh`.

The `width`/`height` attributes matter — they stop the page jumping around while
images load.

## Known gaps

- **Photographs** — all still placeholders.
- **Litter details** — dam and sire names, birth dates and availability read
  "To be confirmed" on both litter pages.
- **Email address** — not published anywhere we could confirm, so the contact
  page is phone-first. A contact form needs a confirmed address and a form
  handler from the host before it is worth adding.
