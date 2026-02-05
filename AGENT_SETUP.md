# Multi-Agent Setup Progress

## ✅ Completed

### Agent Configs Created
| Agent | Role | Primary Model | Fallback | Workspace |
|-------|------|---------------|----------|-----------|
| **Jarvis** | Squad Lead | Kimi K2.5 | GPT-5.2 | `agents/jarvis/` |
| **Shuri** | Product Analyst | GPT-5.2 | Kimi K2.5 | `agents/shuri/` |
| **Fury** | Customer Researcher | Gemini 3 Pro | GPT-5.2 | `agents/fury/` |
| **Vision** | SEO Analyst | Gemini 3 Pro | GPT-5.2 | `agents/vision/` |
| **Loki** | Content Writer | GPT-5.2 | Gemini 3 Pro | `agents/loki/` |
| **Friday** | Developer | GPT-5.2 | Kimi K2.5 | `agents/friday/` |

### Files Created
- ✅ `SOUL.md` for each agent (personality, role, boundaries)
- ✅ `openclaw.json` for each agent (model config, heartbeat settings)
- ✅ Agent workspaces at `~/.openclaw/workspace/agents/{name}/`

### Mission Control
- ✅ Dashboard running at http://localhost:3000
- ✅ Convex backend running at http://127.0.0.1:3210
- ✅ 6 agents seeded in database
- ✅ 3 initial tasks created

## ⏳ Next Steps

### 1. Start Agent Sessions
Each agent needs to run as a separate OpenClaw session:

```bash
# Terminal 1 - Jarvis
openclaw agent:start --config agents/jarvis/openclaw.json --session agent:main:main

# Terminal 2 - Shuri
openclaw agent:start --config agents/shuri/openclaw.json --session agent:product-analyst:main

# ... etc for all 6 agents
```

### 2. Set Up Cron Jobs
Add to system crontab or use OpenClaw's built-in cron:

```bash
# Jarvis - every 15 min at :00
0,15,30,45 * * * * openclaw sessions:send agent:main:main "Check Mission Control"

# Shuri - every 15 min at :02
2,17,32,47 * * * * openclaw sessions:send agent:product-analyst:main "Check Mission Control"

# ... staggered for all agents
```

### 3. Webhook Integration
Create scripts for agents to report to Mission Control:

```bash
# agents/jarvis/report.sh
#!/bin/bash
curl -X POST "$CONVEX_URL/api/webhook" \
  -H "Authorization: Bearer $WEBHOOK_SECRET" \
  -d '{
    "sessionKey": "agent:main:main",
    "action": "heartbeat",
    "payload": {"status": "active"}
  }'
```

### 4. Test Flow
1. Create task in Mission Control
2. Assign to agent
3. Agent wakes up, sees task
4. Agent does work, updates status
5. Activity appears in dashboard

## Model Selection Rationale

| Agent | Primary Model | Why |
|-------|---------------|-----|
| Jarvis | Kimi K2.5 | Fast, good for coordination |
| Shuri | GPT-5.2 | Strong reasoning for analysis |
| Fury | Gemini 3 Pro | Large context for research |
| Vision | Gemini 3 Pro | Large context for SEO data |
| Loki | GPT-5.2 | Best writing quality |
| Friday | GPT-5.2 | Best coding, with 4o-mini subagents |

## Cost Optimization
- **Heartbeats**: All use Gemini 2.0 Flash ($0.50/M tokens)
- **Main work**: Mix of Kimi, GPT-5.2, Gemini 3 Pro based on task
- **Sub-agents**: GPT-4o Mini for parallel coding tasks

## Files Location
```
~/.openclaw/workspace/
├── agents/
│   ├── jarvis/
│   │   ├── SOUL.md
│   │   └── openclaw.json
│   ├── shuri/
│   ├── fury/
│   ├── vision/
│   ├── loki/
│   └── friday/
└── mission-control/
    └── (dashboard)
```
