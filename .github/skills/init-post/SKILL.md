---
name: init-post
description: Create an empty Jekyll blog post skeleton in this repository with complete YAML frontmatter. Use when asked to initialize a post, scaffold a blog post, or create a post skeleton from a title; ask for the title if it is missing.
---

# Initialize a post

Create one unpublished Markdown post, leaving its content for the user to write later.

## Input

- Accept the post title from the user's request or skill arguments.
- If the title is absent or whitespace-only, ask for it before creating any file.
- Use today's local date unless the user supplies a valid date in `YYYY-MM-DD` format.
- Accept explicitly supplied metadata, but do not ask for optional metadata or invent a description, summary, tags, categories, icon, or image.

## Procedure

1. Read `AGENTS.md`, the post defaults in `_config.yml`, and representative recent posts to confirm the repository's conventions.
2. Derive a filename slug from the title: lowercase it, transliterate accented Latin letters to ASCII, replace runs of characters outside `a-z` and `0-9` with a single hyphen, and trim leading/trailing hyphens. Preserve the original title in the frontmatter. If the slug is empty, ask for a nonempty filename slug containing only lowercase ASCII letters, digits, and single separating hyphens.
3. Use `_posts/YYYY-MM-DD-slug.md`, with the same date in the filename and frontmatter. Do not use a literal `YYYY-MM-DD` placeholder or put the file in `_drafts`.
4. Check whether the target file already exists. Never overwrite an existing post; report the collision and ask for a different date or slug.
5. Create the file using the template below. Substitute the title and date; use supplied metadata where applicable. Keep `published: false` unless the user explicitly requests publication. Serialize text as valid YAML strings, escaping quotes, backslashes, and line breaks rather than inserting raw user input into YAML. Keep dates as ISO dates, tags/categories as YAML lists, and `published` as a boolean. Leave unknown text fields empty and `image` null; do not reference nonexistent assets.
6. Leave the body completely empty after the closing `---` and a newline. Do not add a heading, outline, TODO, sample prose, or HTML comment. Do not create assets or modify other posts or configuration.
7. Read the created file back and verify the YAML delimiters, metadata, matching filename/date, and empty body. Parse the frontmatter with an available YAML parser when practical. Report validation failures explicitly.
8. Report the created path and remind the user that `published: false` keeps it hidden until they are ready.

## Frontmatter template

```yaml
---
title: "<post title>"
author: "Alberto Gregorio"
icon: ""
date: YYYY-MM-DD
layout: post
categories: []
tags: []
description: ""
summary: ""
image: null
published: false
---
```

`description` is used by the site's HTML metadata; some existing posts also use `summary`, so include both as editable fields. The explicit `post` layout mirrors the configured default. An empty icon is intentional until the user chooses one.
