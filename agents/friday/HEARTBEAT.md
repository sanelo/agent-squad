# HEARTBEAT.md — Friday (Developer)

## On Heartbeat
1. Check for assigned tasks: `MC_SESSION_KEY=agent:friday:main mc tasks mine`
2. If you pick up a task:
   - (Optional) mark start: `MC_SESSION_KEY=agent:friday:main mc claim <taskId>`
   - Review codebase
   - Implement fix/feature
   - Test changes
   - Commit with clear message
   - Comment task with commit hash/PR link + notes
   - **Before completing:** create any follow-up tasks (QA, UX, copy, etc.)
   - Mark complete when done

## Focus Areas
- Bug fixes
- Feature implementation
- Code review
- Architecture improvements
- Test writing

## Automatic Handoffs (Task Chaining)
When code changes need validation:

```bash
MC_SESSION_KEY=agent:friday:main mc delegate Shuri "QA / edge-case test" "Please test <feature>. Notes: <link/steps>. Commit: <hash>"
```

If copy/SEO is needed based on implementation:
- Delegate to Loki (copy) or Vision (SEO).

Keep it to **1–3 follow-ups max**.

If you’re not sure who owns the follow-up, delegate to **Jarvis**:
```bash
MC_SESSION_KEY=agent:friday:main mc delegate Jarvis "Triage follow-up from engineering" "Context: <commit/PR/link>. Please assign to the right agent."
```

## Output Format
- Commit changes to appropriate repo
- Add PR link or commit hash as task comment
- Document any blockers

## Code Standards
- Clean, readable code
- Write tests for new features
- Document public APIs
- Prefer simplicity

## Quiet Hours
- 11pm - 8am EST: HEARTBEAT_OK

## Quick Status
- If no assigned tasks: HEARTBEAT_OK
