---
name: mcp-autotask
description: Execute a task end-to-end using the MCP task record and repo workflow, saving key decisions to memory
arguments:
  - name: task_number
    description: "Numeric task ID (example: 70)"
    required: true
---
Execute this task fully with no feedback loop unless blocked by missing credentials/permissions.

Inputs:
- `task_number`: `$ARGUMENTS`

## 1. Task Resolution (required before implementation)

- Resolve the task in the `dgroup-standards` MCP service.
- Try `get_task_context(task_number)` first.
- If scope is ambiguous or no task is returned, use `list_tasks`, `search_tasks`, `get_task`, and scoped `get_task_context` calls to pick the single best match.
- If no task can be resolved, stop and report blocked input with the exact MCP lookup(s) attempted.
- Once resolved, set:
  - `task_id` = fully-qualified task identifier
  - `task_name` = resolved task title or identifier
  - `taskslug` = `task_id` lowercased, non-alphanumeric replaced with `-`, leading/trailing `-` trimmed
- Build `task_snippet` from the resolved MCP task record before implementation:
  - Include the task title and status.
  - Include dependencies and acceptance criteria sections when present.
  - Include any explicit constraints/notes relevant to implementation and testing.
  - If those sections are missing, include a concise fallback snippet from the top of the task body.
- Use `task_snippet` as the implementation source context (instead of requiring the user to paste task content inline).
- Update the task status to `In Progress` via `update_task(task_number, status: "In Progress")`.

## 2. Context Gathering (all from MCP)

All standards, ADRs, and coding guidelines MUST be fetched from the `dgroup-standards` MCP server — never read docs directly when the MCP server is available.

- Fetch coding standards: `get_coding_standards("flutter")`.
- Fetch relevant ADRs: `list_adrs` to enumerate, then `get_adr(number)` for each applicable ADR.
- Search for additional guidance: `search_guidelines(query)` when the task involves unfamiliar patterns.

## 3. Hard Requirements

- Create a feature branch and worktree in one step: `git worktree add -b codex/{taskslug} ./.worktrees/{taskslug}`
- Implement code + tests for all meaningful changes.
- Respect repo conventions:
  - **Flutter**: Riverpod annotation style, Freezed, GoRouter, GoogleFonts, no manual edits to generated files.
  - Run `dart run build_runner build --delete-conflicting-outputs` after changing annotated models/providers/routes.

## 4. Task Status Updates (via MCP throughout)

Keep the MCP task record current as work progresses:
- Set `In Progress` at the start of implementation (done in step 1).
- If blocked, set `Blocked` and note the reason.
- Set `Done` before opening/updating the PR: `update_task(task_number, status: "Done")`.
- Attach the PR link once created: `update_task(task_number, prLink: "<PR URL>")`.

## 5. Quality Gates

Run quality gates:
- `flutter test`
- `flutter analyze`
- `dart run build_runner build --delete-conflicting-outputs` (if generated files may be stale)

## 6. Commit and Landing Workflow

- Commit with clear, descriptive messages.
- Complete landing workflow:
  - `git pull --rebase origin main`
  - `git push`
  - Verify `git status` indicates up to date with origin.
- Open PR against `main`.
- Include summary, changed files, scope, and exact test commands/results in the PR description.

## 7. Agent Run Logging (via MCP)

At the end of execution (after quality gates, before or alongside the PR), call `log_agent_run(...)` to record a structured execution trace.

### Pre-Flight Checklist

Before calling `log_agent_run`, complete this checklist to populate every field you can:

| Field | How to populate | Required? |
|-------|----------------|-----------|
| `taskNumber` | From the resolved task | Yes |
| `taskId` | From the resolved task | Yes |
| `agentModel` | The model powering this session (e.g., `claude-opus-4-6`) | Yes |
| `outcome` | `success`, `failure`, or `blocked` | Yes |
| `startTime` | Record as the **very first action** of the session | Best-effort |
| `endTime` | Record just before calling `log_agent_run` | Best-effort |
| `durationMs` | Compute `endTime - startTime` in milliseconds | Best-effort |
| `filesModified` | Run `git diff --name-only origin/main...HEAD` | Best-effort |
| `toolCallsSummary` | Reflect on every MCP tool called and build the map | Best-effort |
| `testsRun` | Capture test commands and pass/fail outcome | Best-effort |
| `prLink` | PR URL if one was created | Best-effort |
| `blockerReason` | If outcome is `blocked`, describe the blocker concisely | When blocked |
| `memoryIds` | List of memory IDs created during the run via `remember(...)` | Best-effort |
| `tokenInput` / `tokenOutput` / `tokenCacheRead` | Omit if unavailable. Do not guess. | Omit if unavailable |

**Best-effort:** If `log_agent_run` fails, skip it gracefully — do not treat it as a blocker.

## 8. Memory and Follow-Up Tasks (via MCP)

- Collect any key decisions, blockers, or novel patterns discovered during this run and save them as a new memory via `remember(content, tags, importance)` on the `dgroup-standards` MCP server.
- If there are identified issues that are out of scope for this task but should be completed:
  - Get the next available task number: `get_next_task_number()`.
  - Create and submit a new task using `create_task(title, description, priority)`.
  - Set the new task's status to `Proposed` (it will need review before work begins).
  - Reference the originating task in the new task's description for traceability.

## 9. Execution Rules

- Do not stop for confirmation; only stop if truly blocked, and report exact blocker + command that failed.
- Do not read standards/ADR files from disk when the MCP server can provide them.
- Do not create local task files — all task tracking goes through MCP.
- Do not leave the task in `In Progress` if the PR is opened — mark it `Done` and attach the PR link.
