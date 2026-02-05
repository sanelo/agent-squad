#!/bin/bash
# Friday's coding sub-agent launcher
# Spawns Opencode with appropriate model for the task

# Default to Sonnet for general coding
MODEL="${OPENCODE_MODEL:-google/antigravity-claude-sonnet-4-5-thinking}"
VARIANT="${OPENCODE_VARIANT:-max}"

# Task type detection
if [[ "$1" == "--complex" ]]; then
    MODEL="google/antigravity-claude-opus-4-5-thinking"
    shift
elif [[ "$1" == "--fast" ]]; then
    MODEL="google/antigravity-gemini-3-pro"
    VARIANT="high"
    shift
fi

PROMPT="$1"

if [ -z "$PROMPT" ]; then
    echo "Usage: $0 [--complex|--fast] 'Your coding prompt here'"
    echo ""
    echo "Options:"
    echo "  --complex  Use Claude Opus 4.5 (architecture, complex bugs)"
    echo "  --fast     Use Gemini 3 Pro (quick fixes, docs, tests)"
    echo "  (default)  Use Claude Sonnet 4.5 (general coding)"
    exit 1
fi

echo "Spawning sub-agent with $MODEL (variant: $VARIANT)..."
echo "Prompt: $PROMPT"
echo ""

# Run Opencode
opencode run "$PROMPT" \
  --model="$MODEL" \
  --variant="$VARIANT"
