# Opencode Integration for Coding Sub-Agents
# Friday uses Opencode with Claude 4.5 models for complex coding tasks

## Available Models (from ~/.config/opencode/opencode.json)

### Claude Models (Best for Coding)
- `google/antigravity-claude-opus-4-5-thinking --variant=max` 
  - **Use for**: Complex architecture, debugging, refactoring
  - **Context**: 200K tokens
  - **Thinking**: 32K budget
  
- `google/antigravity-claude-sonnet-4-5-thinking --variant=max`
  - **Use for**: General coding, feature implementation
  - **Context**: 200K tokens
  - **Thinking**: 32K budget

### Gemini Models (Fast/Cheap)
- `google/antigravity-gemini-3-pro --variant=high`
  - **Use for**: Quick fixes, documentation, tests
  - **Context**: 1M tokens

## Usage Examples

### Complex Feature (Opus)
```bash
opencode run "Design a real-time notification system for Mission Control using WebSockets" \
  --model=google/antigravity-claude-opus-4-5-thinking \
  --variant=max
```

### General Coding (Sonnet)
```bash
opencode run "Implement the task board drag-and-drop feature in React" \
  --model=google/antigravity-claude-sonnet-4-5-thinking \
  --variant=max
```

### Quick Fix (Gemini)
```bash
opencode run "Fix the TypeScript error in AgentCard.tsx" \
  --model=google/antigravity-gemini-3-pro \
  --variant=high
```

## Friday's Sub-Agent Strategy

### When to Spawn Sub-Agents
1. **Parallel work**: Multiple files need changes
2. **Deep focus**: Complex algorithm needs undivided attention
3. **Testing**: Generate comprehensive test suites
4. **Documentation**: Write docs while coding continues

### Sub-Agent Model Selection

| Task Type | Model | Why |
|-----------|-------|-----|
| Architecture design | Claude Opus 4.5 | Best reasoning |
| Feature implementation | Claude Sonnet 4.5 | Fast + capable |
| Bug fixes | Claude Sonnet 4.5 | Good debugging |
| Refactoring | Claude Opus 4.5 | Understands complexity |
| Tests | Gemini 3 Pro | Fast, large context |
| Documentation | Gemini 3 Pro | Fast, good enough |
| Code review | Claude Sonnet 4.5 | Catches issues |

### Example: Parallel Development

```bash
# Friday spawns 3 sub-agents for a feature:

# Sub-agent 1: Backend API (Opus)
opencode run "Create Convex mutations for task management" \
  --model=google/antigravity-claude-opus-4-5-thinking \
  --variant=max &

# Sub-agent 2: Frontend components (Sonnet)
opencode run "Build React task board with drag-drop" \
  --model=google/antigravity-claude-sonnet-4-5-thinking \
  --variant=max &

# Sub-agent 3: Tests (Gemini)
opencode run "Write comprehensive tests for task API" \
  --model=google/antigravity-gemini-3-pro \
  --variant=high &

wait  # All complete
```

## Cost Comparison

| Model | Cost/M tokens | Best For |
|-------|---------------|----------|
| Claude Opus 4.5 | ~$30 | Complex architecture |
| Claude Sonnet 4.5 | ~$18 | General coding |
| Gemini 3 Pro | ~$14 | Fast tasks |
| GPT-4o Mini | ~$0.60 | Simple tasks |

## Integration with OpenClaw

Friday can spawn Opencode from within OpenClaw:

```typescript
// In Friday's OpenClaw session
const result = await exec(`
  opencode run "${prompt}" \
    --model=google/antigravity-claude-sonnet-4-5-thinking \
    --variant=max
`);
```

Or use the `sessions_spawn` tool to create isolated sub-agents.

## Best Practices

1. **Start with Sonnet**: It's fast and capable for most tasks
2. **Escalate to Opus**: When stuck or need architecture help
3. **Use Gemini for speed**: Documentation, tests, simple fixes
4. **Parallelize**: Spawn multiple sub-agents for independent work
5. **Review outputs**: Always review sub-agent code before committing
