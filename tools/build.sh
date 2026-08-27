#!/usr/bin/env bash
# Assembles the static pages from tools/partials + tools/pages.
# The committed .html files in the repo root are the deliverable; this script
# only exists so the shared header/footer stay in sync when they are edited.
set -euo pipefail
cd "$(dirname "$0")/.."

build() { # slug  title  description
  local slug="$1" title="$2" desc="$3"
  local out="$slug.html"
  {
    sed -e "s|{{TITLE}}|$title|g" -e "s|{{DESC}}|$desc|g" tools/partials/head.html
    cat "tools/pages/$slug.body.html"
    cat tools/partials/foot.html
  } > "$out"
  # Mark the current page in the nav.
  sed -i "s|<a class=\"nav-link\" href=\"$out\">|<a class=\"nav-link\" href=\"$out\" aria-current=\"page\">|" "$out"
  echo "  built $out"
}

echo "Building Creekstone Retrievers pages..."
build index              "Creekstone Retrievers — Golden Retriever Puppies near Birmingham, Alabama" "Family-raised Golden Retriever and English Cream puppies on an Alabama country farm since 1985. AKC registered, OFA hip, heart and eye certified parents. Morris, Alabama."
build about-us           "About Creekstone Retrievers — Raising Goldens since 1985"                  "Founded in 1985 by Cindy Stubbs on a country farm north of Birmingham, Alabama. How our Golden Retriever puppies are raised, socialized and cared for."
build available-litters  "Available Golden Retriever Litters — Creekstone Retrievers"                "Golden Retriever and English Cream puppies available now from Creekstone Retrievers in Morris, Alabama. English Creams \$2,500. \$500 deposit secures your pick."
build upcoming-litters   "Upcoming Golden Retriever Litters — Creekstone Retrievers"                 "Upcoming Golden Retriever and English Cream litters at Creekstone Retrievers. Call Cindy Stubbs to join the list for an upcoming litter."
build directions         "Directions to Creekstone Retrievers — Morris, Alabama"                     "Driving directions to Creekstone Retrievers at 1963 Glenwood Road, Morris, Alabama 35116, just minutes north of Birmingham."
build contact-us         "Contact Creekstone Retrievers — Morris, Alabama"                           "Call Cindy Stubbs at 205-681-6857 or 205-281-7271, or send us a message about Golden Retriever puppies at Creekstone Retrievers."
echo "Done."
