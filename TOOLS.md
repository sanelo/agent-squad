# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Examples

```markdown
### Cameras

- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH

- home-server → 192.168.1.100, user: admin

### TTS

- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod
```

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

---

## AI/CLI Tools

### Codex CLI (OpenAI)
- **Status:** Authenticated via browser (ChatGPT login)
- **Version:** 0.96.0
- **Usage:** `codex exec "prompt"` (non-interactive) or `codex` (interactive)
- **Note:** Running on WSL2 — browser auth works via Windows host

### Gemini CLI (Google)
- **Status:** Authenticated
- **Version:** 0.27.0
- **Usage:** `gemini "prompt"`
- **Location:** `/home/linuxbrew/.linuxbrew/bin/gemini`

### Kimi CLI (Moonshot AI)
- **Status:** Authenticated
- **Version:** 1.7.0
- **Usage:** `kimi --print --prompt "your prompt here"`
- **Location:** `/home/sanelo/.local/bin/kimi`
- **Note:** Backup coding agent when Codex/Gemini are rate-limited
- **Model:** Kimi K2.5 (kimi-coding)

---

Add whatever helps you do your job. This is your cheat sheet.
