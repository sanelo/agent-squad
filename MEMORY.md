# MEMORY.md

## Projects

### architop.agency
- Software development agency positioning: AI + Senior Developers (me + Dash) = faster, more robust apps at lower cost
- Status: Landing page live, PRD studio built
- PRD Studio: AI helps prospects flesh out requirements → notification to me → I get a complete doc to quote from
- Next: Customer acquisition (the hard part)

### AI Trading Tool
- Automated trading system
- Status: Pretty far along, working out bugs
- Blocker: Debugging/testing

### Mission Control
- AI Agent Squad Management Dashboard
- Stack: Next.js 16 + TypeScript + Tailwind + shadcn/ui
- Features: Agent cards, Task board (kanban), Activity feed
- Repo: https://github.com/sanelo/mission-control
- Status: v1 built and deployed
- Next: Convex integration for real-time data, agent messaging, document storage

### Tooling Setup
- **Codex CLI:** ✅ Authenticated (ChatGPT login via Windows browser)
- **Gemini CLI:** ✅ Authenticated and working
- **Kimi CLI:** ✅ Authenticated (backup for coding tasks)
- **OpenClaw Skills:** Installed 15+ skills for dev, deployment, finance, Twitter, etc.
- **OpenClaw Models (Cost-Optimized):**
  - **Primary:** Kimi K2.5 (`/model kimi`)
  - **Fallbacks:** GPT-5.2 → Gemini 3 Pro → Gemini 2.5 Pro → GPT-4o
  - **Sub-agents:** GPT-4o Mini (cheap for parallel work)
  - **Heartbeats:** Gemini 2.0 Flash (ultra-cheap, every 30min)
  - **Vision:** Gemini 2.0 Flash → GPT-4o fallback
  - **Quick aliases:** `kimi`, `gpt52`, `gpt52p`, `gpt4o`, `mini`, `g3p`, `g25p`, `flash`
- **Twitter/X Access:** ✅ Authenticated as @sanelo_ via Brave cookies

## Learnings from Feed (pbteja1998 Mission Control)

### Multi-Agent System Architecture
- **10 agents working together** via OpenClaw (formerly Clawdbot)
- Each agent has: unique session key, SOUL.md (personality), specialized role
- Agents communicate via shared database (Mission Control) or direct session messaging
- Heartbeat system: agents wake every 15 min via cron, check for work, then sleep

### Key Principles Learned
1. **Memory is critical** - Write to files, not "mental notes". Files survive restarts.
2. **Agent personalities matter** - Specific roles ("skeptical tester") beat generalists
3. **Use cheap models for routine work** - Heartbeats don't need expensive models
4. **Shared workspace** - All agents read/write to same files for coordination
5. **Staggered heartbeats** - Agents wake at different times to avoid API rate limits
6. **HEARTBEAT_OK** - Agents should stay silent when nothing needs attention

### Agent Roles That Work
- Jarvis (Squad Lead) - coordinator, primary interface
- Shuri (Product Analyst) - skeptical tester, finds edge cases
- Fury (Customer Researcher) - deep research, provides receipts
- Vision (SEO Analyst) - keywords, search intent
- Loki (Content Writer) - wordsmith, opinionated on style
- Friday (Developer) - clean, tested, documented code
- Pepper (Email Marketing) - drip sequences, lifecycle

### Task Flow
Inbox → Assigned → In Progress → Review → Done → Blocked

### Cost Optimization Strategy
- **Heartbeat checks:** Cheap models (Gemini Flash, GPT-4o Mini)
- **Creative work:** Expensive models (GPT-5.2, Claude Opus)
- **Sub-agents:** Mid-tier models (DeepSeek R1, GPT-4o)
- **Potential savings:** 50-80% vs using one expensive model for everything

## Notes
- Prefers gentle accountability, but escalate to "annoying" if stalling without good reason
- Family constraints are real — work happens in pockets

## References
- **Awesome OpenClaw Skills:** https://github.com/VoltAgent/awesome-openclaw-skills — Catalog of 1700+ skills for extending capabilities
