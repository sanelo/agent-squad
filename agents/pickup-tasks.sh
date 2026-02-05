#!/bin/bash
# pickup-tasks.sh - Agent task auto-pickup script
# Usage: ./pickup-tasks.sh <agent-name>

AGENT_NAME=$1
AGENT_ID=$1

if [ -z "$AGENT_NAME" ]; then
    echo "Usage: $0 <agent-name>"
    exit 1
fi

echo "[$AGENT_NAME] Waking up at $(date)"

# Send wake message to agent - they'll check Mission Control for tasks
openclaw sessions:send "agent:${AGENT_ID}:main" "Check Mission Control for any tasks assigned to you. If you have assigned tasks, start working on them. Update status to in_progress when you begin. Report HEARTBEAT_OK if no tasks." 2>/dev/null

echo "[$AGENT_NAME] Wake message sent"
