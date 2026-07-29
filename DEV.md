# Development

This repository contains the GitHub profile README, the `romanv.dev` Astro site, and the bilingual PDF resume generator.

## Environment

The development environment is self-contained and pinned in `flake.lock`. It uses public nixpkgs directly and does not depend on personal NixOS configurations, overlays, Home Manager modules, or absolute host paths.

With nix-direnv installed:

```bash
direnv allow
```

This loads Node.js, npm, GNU Make, direnv, nixfmt, and the Playwright Chromium build required by the PDF generator. Without direnv, enter the same environment manually:

```bash
nix develop
```

## First run

```bash
make install
```

Inside the Nix environment, `make install` uses Chromium from nixpkgs and does not download a second browser through npm.

## Commands

```bash
make dev          # live site at http://localhost:5173
make build        # generate resumes and build the production site
make preview      # preview the production build
make lint         # run Astro and TypeScript checks
make format       # format frontend and resume sources
make generate     # regenerate both PDF resumes
make en           # regenerate the English PDF
make ru           # regenerate the Russian PDF
```

The main commands are also exposed as flake apps and work without entering a shell:

```bash
nix run .#dev
nix run .#build
nix run .#preview
nix run .#lint
nix run .#format
nix run .#resume
nix run .#install
```

Set `SHOW_MASTERS=true` when the master's degree should be included in the website build or generated PDFs:

```bash
make build SHOW_MASTERS=true
```

## Structure

- `README.md` is the public GitHub profile and intentionally contains no development documentation.
- `romanv.dev/src/` contains the bilingual Astro site.
- `romanv.dev/resume/` contains the structured resume content, HTML generator, and print stylesheet.
- `romanv.dev/public/documents/` contains the generated one-page English and Russian PDFs.
