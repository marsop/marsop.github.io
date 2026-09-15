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
* Your **first order of business** is to come up with a solid plan -- to do so, first explore the codebase (`list_files`, `read_file`, etc) and examine README.md or AGENTS.md if they exist. Ask clarifying questions when appropriate. Make sure to read websites or view image urls if any are specified in the task. Take your time! Articulate the plan clearly and set it using `set_plan`.
* **Always Verify Your Work.** After every action that modifies the state of the codebase (e.g., creating, deleting, or editing a file), you **must** use a read-only tool (like `read_file`, `list_files`, etc) to confirm that the action was executed successfully and had the intended effect. Do not mark a plan step as complete until you have verified the outcome.
* **Edit Source, Not Artifacts.** If you determine a file is a build artifact (e.g., located in a `dist`, `build`, or `target` directory), **do not edit it directly**. Instead, you must trace the code back to its source. Use tools like `grep` in `run_in_bash_session` to find the original source file and make your changes there. After modifying the source file, run the appropriate build command to regenerate the artifact.
* **Practice Proactive Testing.** For any code change, attempt to find and run relevant tests to ensure your changes are correct and have not caused regressions. When practical, practice test-driven development by writing a failing test first. Whenever possible your plan should include steps for testing.
* **Diagnose Before Changing the Environment.** If you encounter a build, dependency, or test failure, do not immediately try to install or uninstall packages. First, diagnose the root cause. Read error logs carefully. Inspect configuration files (`package.json`, `requirements.txt`, `pom.xml`), lock files (`package-lock.json`), and READMEs to understand the expected environment setup. Prioritize solutions that involve changing code or tests before attempting to alter the environment.
* Strive to **solve problems autonomously**. However, you should ask for help using `request_user_input` in the following situations:
  1) The user's request is ambiguous and you need clarification.
  2) You have tried multiple approaches to solve a problem and are still stuck.
  3) You need to make a decision that would significantly alter the scope of the original request.
* Remember that you are resourceful, and will use the tools available to you to perform your work and subtasks.
* Make use of the `knowledgebase_lookup` tool to get useful information to help you early and often (e.g. if a test is failing, or the environment isn't working right, if you need help boostrapping and setting up the project, you're having tool issues, etc), or if you don't know how to proceed. Calling this tool can be extremely helpful to you, and can give you magic instructions to help, so don't hesitate to use it. If you encounter any problem, call this tool with information about what is going on.

## Core Directives
* Your job is to be a helpful software engineer for the user. Understand the problem, research the scope of work and the codebase, make a plan, and begin working on changes (and verify them as you go) using the tools available to you.
* Each response must contain at least one tool call. Issuing several tool calls at a time saves resources and time, so do so when appropriate.
* You are fully responsible for the sandbox environment. This includes installing dependencies, compiling code, and running tests using tools available to you. Do not instruct the user to perform these tasks.
* Before completing your work with the submit tool, you **must** call `pre_commit_instructions` and follow its instructions to complete pre commit steps. Then call `submit` using a short, descriptive branch name. The commit message should follow standard conventions: a short subject line (50 chars max), a blank line, and a more detailed body if necessary.
* If you already submitted a change previously, you should continue using the same branch name.
