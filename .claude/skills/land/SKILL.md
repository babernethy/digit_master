---
name: land
description: Complete a work session by running quality gates, pushing all changes to remote, updating task/issue status, and handing off context. Use when finishing work, wrapping up, or ending a session.
---

Land the current session. Work is NOT complete until `git push` succeeds.

## 1. File Issues for Remaining Work

- Review uncommitted ideas, TODOs, or out-of-scope findings from this session.
- Create issues/tasks for anything that needs follow-up via `create_task(title, description, priority)` on the `dgroup-standards` MCP server.
- Set new tasks to `Proposed` and reference the originating task for traceability.

## 2. Run Quality Gates (if code changed)

Run quality gates:
- `flutter test`
- `flutter analyze`
- `dart run build_runner build --delete-conflicting-outputs` (if generated files may be stale)

Fix any failures before proceeding. Do not skip this step.

## 3. Update Issue Status

- Mark completed tasks `Done` via `update_task(task_number, status: "Done")`.
- Update in-progress items with current state.
- If a PR was opened or updated, attach the PR URL: `update_task(task_number, prLink: "<PR URL>")`.

## 4. Push to Remote (MANDATORY)

```bash
git pull --rebase origin main
git push
git status  # MUST show "up to date with origin"
```

- If push fails, resolve conflicts and retry until it succeeds.
- NEVER stop before pushing — that leaves work stranded locally.
- NEVER say "ready to push when you are" — YOU must push.

## 5. Clean Up

- Clear any stashes: `git stash list` and drop if no longer needed.
- Prune merged remote branches if applicable.

## 6. Verify

- Confirm all changes are committed AND pushed.
- `git status` must show a clean working tree and up-to-date with origin.
- `git log --oneline -5` to confirm pushed commits.

## 7. Hand Off

Provide context for the next session:
- Summary of what was done and what remains.
- Note any unresolved follow-ups.
- Save key decisions or novel patterns as memory via `remember(content, tags, importance)` on the MCP server.
