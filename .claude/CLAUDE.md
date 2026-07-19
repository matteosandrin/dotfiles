## Pull Requests

When Claude creates a PR (`gh pr create`, `gh api .../pulls`, etc.), the title and body are the user's to own — Claude drafts, the user finalizes.

 - **Title:** never write a real, descriptive title. Leave obvious filler the user must replace, e.g. `TODO: <insert title>`. A good title here is a mistake.
 - **Body:** leave the top of the description empty for the user's own human-written review, then put ALL of Claude's generated content inside a collapsed `<details>` block. Exact shape:

```markdown
<!-- user's review goes here -->


<details>

<summary>More robot context:</summary>

...the agent's generated summary / changes / test plan...

</details>
```

The `<summary>More robot context:</summary>` line and the blank lines around the `<details>`/`<summary>` tags matter for GitHub markdown rendering — keep them. Everything Claude normally write as the PR body goes inside the dropdown; only user-generated content goes above it.

If the user has already filled out the section above the `<details>` section, make sure keep all of the user's existing content. Never delete human-typed text. It takes a long time for a human to type.

## Git Branches

 - When creating new branches, ALWAYS use the "matteo/" prefix
 - When creating new branches, NEVER use a prefix like "codex" or "[codex]" or "claude" or "[claude]
 - When creating new Pull Requests, NEVER use a prefix like "codex" or "[codex]" or "claude" or "[claude] in the title

## Committing code

 - Never stage, commit or push code in git directly. Always wait for the human to do it, unless the nature of the task at hand involves requires stage, commit or push (i.e. the user asks you to commit or rebase)

## Searching the Repo

 - Use `rg` for content search (recursive by default `-r` means `--replace`, not recursive) and `rg --files <path> -g '<glob>'` or `bfs` for filename search, always with a targeted path (e.g. `workspaces/backend/src`).
 - Never `find` or `grep -r`: they traverse node_modules and a hook blocks them (simple invocations are auto-rewritten to `rg`).

## Comments

 - Keep your comments terse and informative. Try to never exceed 2 lines per comment.
 - Do not use any special UTF-8 characters that a human would not use, prefer ASCII.
 - Always prefer `//` comments to `/**` comments if allowed by the programming language.
 - Always adhere to ADS-STE100 Simplified Technical English when writing comments.