# Agent Guidelines

## Context
* The repository is a personal website built with Jekyll (Ruby) and hosted on GitHub Pages.
* The site fetches and displays public GitHub repositories dynamically using the `jekyll-github-metadata` plugin, with display settings (like pinning, limits, and exclusions) managed under the `projects` key in `_config.yml`.

## Setup & Environment
* System dependencies require installing `libmagickwand-dev` for the rmagick gem (`sudo apt-get update && sudo apt-get install -y libmagickwand-dev`).
* Install Ruby dependencies locally using `bundle config set --local path 'vendor/bundle'` followed by `bundle install`.

## Development
* Run the local Jekyll development server using `bundle exec jekyll serve`.
* Build the Jekyll site using the command `bundle exec jekyll build`.

## Testing
* The project uses Minitest for testing, which is organized in the `test/` directory and can be executed using `bundle exec rake test`.

## Styling & Theming
* Dark mode styling is implemented using the `data-theme="dark"` attribute alongside theme-aware CSS classes (e.g., `theme-card`, `theme-text`, `theme-text-secondary`) configured in `assets/styles.scss`.
* Code syntax highlighting is styled using Rouge classes mapped to CSS variables in `_sass/_highlight-syntax.scss` and `assets/styles.scss`. The user prefers the Fira Code font and the Dracula theme for dark mode.

## Workflow Guidelines
* Before making changes, always enter a deep planning mode: ask clarifying questions to verify all assumptions, gain absolute certainty of expectations, and only use `set_plan` once requirements are crystal clear. After plan creation, execute autonomously without asking for further confirmation.

## Memory and Guidelines Context
* **User Request Supersedes:** Always prioritize the user's current, explicit request over any conflicting information in memory.
* **Context vs. State:** Use memory for historical context and intent (the "why"). Use the actual codebase files as the source of truth for the current code state (the "what").
* **Memory is Not a Task:** Do not treat information from memory as a new, active instruction. Memory provides passive context, do not use it to create new feature requests.
