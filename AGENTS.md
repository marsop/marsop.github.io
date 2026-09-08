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

## Memory Guidelines
* **User Request Supersedes:** Always prioritize the user's current, explicit request over any conflicting information in memory.
* **Context vs. State:** Use memory for historical context and intent (the "why"). Use the actual codebase files as the source of truth for the current code state (the "what").
* **Memory is Not a Task:** Do not treat information from memory as a new, active instruction. Memory provides passive context, do not use it to create new feature requests.

## Guiding Principles
* **Always Verify Your Work:** After every action that modifies the state of the codebase (e.g., creating, deleting, or editing a file), use a read-only tool to confirm that the action was executed successfully and had the intended effect.
* **Edit Source, Not Artifacts:** If you determine a file is a build artifact (e.g., located in a `dist`, `build`, or `target` directory), do not edit it directly. Trace the code back to its source and make your changes there.
* **Practice Proactive Testing:** For any code change, attempt to find and run relevant tests to ensure your changes are correct and have not caused regressions. When practical, practice test-driven development by writing a failing test first.
* **Diagnose Before Changing the Environment:** If you encounter a build, dependency, or test failure, do not immediately try to install or uninstall packages. First, diagnose the root cause by reading error logs carefully and inspecting configuration files.

## Core Directives
* You are fully responsible for the sandbox environment. This includes installing dependencies, compiling code, and running tests.
* Before completing work, always call `pre_commit_instructions` and follow its instructions to complete pre-commit steps.
