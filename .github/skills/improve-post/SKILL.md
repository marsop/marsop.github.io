---
name: improve-post
description: Proofread and polish an existing Jekyll post, correcting grammar and awkward wording, adding relevant links, and completing frontmatter. Use when asked to improve, edit, or proofread a post.
---

# Improve a post

Edit an existing Jekyll post to improve its language, add relevant links, and complete frontmatter while preserving the author's meaning and intent.

## Input

- Use the post path supplied by the user or identified in the conversation.
- If no post is identified and there are multiple plausible candidates, ask which post to edit. Do not guess.
- Respect any explicit scope, such as proofreading only, preserving a particular style, or not changing metadata.

## Procedure

1. Read `AGENTS.md`, the target post, and representative recent posts to confirm the repository's conventions. Check the working-tree status and preserve unrelated user changes.
2. Read the full post, including its frontmatter. Identify grammatical errors, misspellings, unnatural or unclear expressions, and empty or missing metadata fields.
3. Edit the prose for correctness, clarity, and natural phrasing. Preserve the author's voice, tone, meaning, and level of certainty. Do not add facts, arguments, or claims.
4. Preserve direct quotations, names, dates, URLs, and code as written unless the user asks to edit them or an error is clearly in the surrounding text rather than the quoted source. Do not silently change factual details.
5. Add useful links for specific products, technologies, organizations, publications, studies, or related posts mentioned in the article. Prefer official or primary sources, use descriptive text that fits the existing prose, and verify each URL. Avoid overlinking generic terms or adding links that do not help readers; never guess a URL. Do not alter the wording of direct quotations to add links.
6. Complete frontmatter fields that can be responsibly derived from the post, following nearby posts' conventions. Write concise `description` and/or `summary` when those fields are used or already present; suggest only relevant, conservative `categories` and `tags`. Do not invent an image or other unsupported metadata. Keep metadata valid YAML.
7. Preserve the existing `published` value and all other intentional author choices. Do not change the filename or date unless requested.
8. Make focused edits only. Do not modify unrelated files, assets, site configuration, or post publication settings.
9. Read the edited post back and verify the prose, links, frontmatter, and YAML structure. Run the smallest relevant validation available; for prose/frontmatter-only changes, a Jekyll build is optional if dependencies are unavailable, and report any validation limitation.
10. Briefly report what was improved and link to the edited post.
