# Agent Guidelines

## Project
- Personal Jekyll site hosted on GitHub Pages.
- Public GitHub repositories are displayed with `jekyll-github-metadata`; display options are under `projects` in `_config.yml`.

## Setup and commands
- Install ImageMagick headers for RMagick on Debian-based systems: `sudo apt-get update && sudo apt-get install -y libmagickwand-dev`.
- Install Ruby dependencies: `bundle config set --local path 'vendor/bundle'`, then `bundle install`.
- Serve locally: `bundle exec jekyll serve`.
- Build: `bundle exec jekyll build`.
- Run tests: `bundle exec rake test` (Minitest, in `test/`).

## Conventions
- Dark mode uses `data-theme="dark"` and theme-aware classes. Styles are in `assets/styles.scss`.
- Rouge syntax highlighting is styled in `_sass/_highlight-syntax.scss` and `assets/styles.scss`. Use Fira Code and the Dracula dark theme.

## Changes and validation
- Keep changes focused and follow existing patterns; edit source files, not generated output.
- Run the relevant tests and build for the files changed. Diagnose failures before changing dependencies.
