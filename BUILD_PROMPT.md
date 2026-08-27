# Build Prompt — Creekstone Retrievers Website Rebuild

**Status:** v2 — spec locked, site built against it, photography outstanding
**Source site:** https://www.creekstoneretrievers.com/

---

## 1. Objective

Rebuild the Creekstone Retrievers website as a modern, fast, mobile-first static
site that preserves the **existing content, photography, and visual character**
of the current site. This is a re-skin and re-build, not a rebrand: a returning
visitor should recognize it immediately. The business is a Golden Retriever
breeder in Alabama, family-run since 1985.

Success means: same information, same photos, same warmth and tone — delivered
in a site that loads fast, works on a phone, and looks like it was built this
decade rather than in 2004.

---

## 2. Source sitemap (confirmed)

The existing site has six pages:

| # | Page | URL |
|---|------|-----|
| 1 | Home | `/home.html` |
| 2 | About | `/about-us.html` |
| 3 | Available Litters | `/available-litters.html` |
| 4 | Upcoming Litters | `/upcoming-litters.html` |
| 5 | Contact | `/contact-us.html` |
| 6 | Directions | `/lost---found.html` |

The new site mirrors this structure, with cleaned-up URLs:
`/`, `/about/`, `/available-litters/`, `/upcoming-litters/`, `/contact/`, `/directions/`

Keep the old paths working via redirects (or duplicate `.html` files) so existing
links and search results don't break — `lost---found.html` in particular is a
legacy filename that must still resolve to the Directions page.

---

## 3. Content inventory (recovered from the live site — use verbatim where possible)

### Business facts
- **Name:** Creekstone Retrievers
- **Founded:** 1985, by **Cindy Stubbs**
- **Location:** a country farm just minutes north of **Birmingham, Alabama**
- **Address:** 1963 Glenwood Road, Morris, AL 35116
- **Phone:** 205-681-6857 and 205-281-7271
- **Breed:** Golden Retrievers, including **English Cream** Golden Retrievers

### About / philosophy
- Located on a beautiful country farm with a **large lake** and lots of room for
  the Goldens to run and play.
- Dedicated to raising beautiful Golden Retriever puppies and giving new family
  members a **well socialized beginning in life**.
- All of their Golden Retrievers have a **great temperament** and make wonderful
  companions **for all ages**.
- All Goldens — adults as well as puppies — are **well socialized with their family**.
- Puppies are raised **indoors on concrete floors**, with **heat in winter** and
  **air conditioning in summer**.
- They take **walks with the puppies on the farm** to familiarize them with
  different surroundings; there is a **pond for the puppies to play in during
  spring and summer**, and **wooded paths to walk in fall and winter**.

### Health, registration, and terms
- All puppies are **AKC registered** and sold on a **Limited Registration**.
- Parents are **OFA hip, heart and eye certified**; they guarantee they breed
  from healthy certified adults.
- Puppies are **examined by their veterinarian** and come with a **written
  warranty** before going to their new homes.
- **Warranty exclusion (state plainly, do not bury):** they do not guarantee or
  accept responsibility for puppies that develop cancer, cataracts, epilepsy, or
  hip dysplasia.

### Pricing
- **English Creams: $2,500.00**
- **Deposit: $500.00** required on all litters to secure your pick.

> **Gap to close:** exact litter listings, individual dog names/bios, and any
> testimonial copy still need to be pulled from the live pages. See §8.

---

## 4. Visual theme

Preserve the current site's character rather than inventing a new one. Target
direction — **to be confirmed against the live site** (see §8):

- **Palette:** warm and earthy, anchored on golden-retriever tones — cream and
  warm off-white backgrounds, golden/honey and caramel accents, deep brown or
  forest-green for text and headers. No cold grays, no neon, no pure black.
- **Feel:** country farm, family, homey, trustworthy. Photography-led. Soft edges,
  generous whitespace, gentle rounded corners on cards and images.
- **Type:** a warm serif for headings (something with personality — Bitter,
  Lora, or similar) paired with a clean, highly readable sans for body text
  (Source Sans, Inter, or similar). Large body text; this audience skews toward
  readers who don't want 13px gray-on-gray.
- **Photography is the star.** The puppies sell the site. Big images, minimal
  chrome over them, no heavy filters or overlays that fight the photos.
- **Avoid:** stock-corporate polish, dark mode-first design, parallax gimmicks,
  autoplay video, carousels that move on their own.

---

## 5. Technical spec

- **Plain static HTML + CSS**, one small vanilla JS file only if needed (mobile
  nav toggle, lightbox). No build step, no framework, no bundler — this must be
  editable by a non-developer and hostable anywhere.
- **Shared stylesheet** (`/assets/css/site.css`) with CSS custom properties for
  the palette so colors can be retuned in one place.
- **Mobile-first and fully responsive.** Test at 375px, 768px, 1440px. No
  horizontal scrolling at any width.
- **Accessibility:** semantic landmarks (`header`/`nav`/`main`/`footer`),
  real alt text on every photo, visible focus states, AA contrast minimum,
  tap targets ≥44px.
- **Performance:** images sized and compressed, `loading="lazy"` below the fold,
  explicit `width`/`height` to prevent layout shift, system-font fallbacks
  declared for every webfont.
- **SEO:** unique `<title>` and meta description per page, Open Graph tags,
  and `LocalBusiness` JSON-LD on the Contact page carrying the real name,
  address, and phone numbers.
- **Tel links:** every phone number is a real `tel:` link so it dials from a phone.

---

## 6. Page-by-page spec

**Global header** — Creekstone Retrievers wordmark, nav across all six pages,
and the phone number visible in the header on desktop. Collapses to a hamburger
on mobile. Current page is visually marked in the nav.

**Global footer** — name, address, both phone numbers, "Family owned since 1985,"
and the nav repeated as text links.

1. **Home** — Full-width hero photo with the name and a one-line positioning
   statement ("Golden Retrievers raised on an Alabama family farm since 1985").
   Then: a short welcome paragraph, three trust points (AKC registered · OFA
   certified parents · Raised in our home since 1985), a preview strip of puppy
   photos, and a clear call to action to Available Litters plus a phone number.

2. **About** — The founding story (Cindy Stubbs, 1985, the farm, the lake), the
   socialization philosophy, and how the puppies are raised — indoors with heat
   and A/C, farm walks, the pond in spring and summer, wooded paths in fall and
   winter. Photo-rich, alternating text and image blocks.

3. **Available Litters** — The primary conversion page. Litter cards: photo,
   litter name/parents, date of birth, availability, price. State clearly that
   English Creams are $2,500 and that a $500 deposit secures your pick, and that
   all puppies are sold on Limited Registration. Prominent "call to reserve"
   with both numbers. Must be trivially easy to update when litters change.

4. **Upcoming Litters** — Same card pattern as Available Litters, forward-looking:
   expected pairings and dates, plus how to get on the list. Both phone numbers.

5. **Contact** — Both phone numbers as tap-to-call, the mailing address, best
   times to call, and a simple contact form (name, email, phone, message) —
   or, if there's no backend, a clearly-labeled `mailto:` fallback. Include the
   `LocalBusiness` JSON-LD here.

6. **Directions** — Driving directions to 1963 Glenwood Road, Morris, AL 35116,
   an embedded or linked map, and the landmark-based directions from the current
   page once recovered. Preserve the `lost---found.html` URL as a redirect.

---

## 7. Asset handling

Every photograph on the current site is to be carried over. For each image:
- Download the original at full resolution.
- Re-export compressed web versions (WebP with JPEG fallback), sized to their
  display width at 2x.
- Store under `/assets/img/` with descriptive kebab-case filenames.
- Write real, specific alt text — "cream golden retriever puppy on the farm
  pond bank," not "puppy."
- Preserve the original files untouched in `/assets/img/originals/` so nothing
  is lost to a bad re-encode.

---

## 8. Build decisions taken

These were open in v1 and are now settled in the code:

- **Flat `.html` filenames at the repository root**, not directory-style URLs.
  This keeps the site hostable on the simplest possible hosting with no rewrite
  rules, and it lets the two legacy filenames survive as real files.
- **Legacy URLs preserved** — `home.html` and `lost---found.html` ship as
  redirect stubs (canonical link + meta refresh + JS fallback) pointing at
  `index.html` and `directions.html`. Nothing that links to the old site breaks.
- **Shared header/footer live in `tools/partials/`**, assembled by
  `tools/build.sh`. The committed `.html` files are the deliverable; the script
  exists only so the six pages cannot drift apart when shared markup changes.
  Hosting still requires no build step.
- **Placeholder images are named for the photographs they stand in for**, so
  swapping in the real files is a rename-and-rebuild rather than a re-layout.
- **No email address is published.** None could be confirmed, and a guessed
  address on a breeder's contact page silently loses puppy enquiries. The
  contact page is phone-first using the two confirmed numbers; the form is
  deferred until an address and a host-side form handler exist.
- **Litter details render as "To be confirmed"** rather than invented names and
  dates. The page structure is finished; only the data is pending.

## 9. Open items — what still stands between this and "perfect"

1. **All photography.** Every image is a placeholder (see blocker below).
2. **Exact theme values** — the real palette, fonts and layout of the current
   site, so "same theme" is matched rather than interpreted. The current theme
   is a considered guess at a golden-retriever farm palette, not a match.
3. **Verbatim page copy** for Home, Available Litters, Upcoming Litters, Contact
   and Directions — currently accurate in substance, not word-for-word.
4. **Current litter data** — dam and sire names, birth dates, availability, price
   per litter, and each litter's photos.
5. **Any dog profile or testimonial pages** not visible in the sitemap in §2.
6. **Email address**, if the business publishes one.
7. **Turn-by-turn directions** — the steps on `directions.html` are derived from
   the address, not from the original page's own landmark directions.

### Blocker

This environment's network egress policy blocks **all** outbound web fetching —
`curl` and the fetch tool alike, for every domain, not only this one. Everything
in §3 was reconstructed through web search, the one channel that works.

To close items 1–7, one of the following is needed:
- allowlist `creekstoneretrievers.com` in the environment's network policy (this
  is set per-environment at claude.ai/code and generally takes effect in a new
  session), or
- supply the images plus a screenshot of each page directly, or
- commit the saved page HTML into the repository.

## 10. Acceptance criteria

Done:
- [x] All six pages built and cross-linked; legacy `.html` URLs still resolve.
- [x] Business facts render exactly as listed in §3 — names, phones, address,
      prices, and the warranty terms including exclusions.
- [x] Clean and responsive at 375px, 768px and 1440px with no horizontal scroll.
- [x] Semantic landmarks, skip link, visible focus states, alt text on every
      image, `aria-current` on the active nav item, 44px tap targets.
- [x] Every phone number is a working `tel:` link.
- [x] `LocalBusiness` JSON-LD on the contact page with the real NAP details.
- [x] No console errors, no broken images, no dead links.

Outstanding:
- [ ] Every photo from the original site present, optimized, with real alt text.
- [ ] Recognizably the same theme as the original, verified against a screenshot.
- [ ] Real litter data on both litter pages.
