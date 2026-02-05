#!/bin/bash
# Stop all agents
# Run: ./stop-agents.sh

echo "Stopping AI Agent Squad..."

for agent in jarvis shuri fury vision loki friday; do
    pidfile="$agent/agent.pid"
    if [ -f "$pidfile" ]; then
        pid=$(cat "$pidfile")
        if kill "$pid" 2>/dev/null; then
            echo "[$agent] Stopped (PID $pid)"
        else
            echo "[$agent] Already stopped or PID not found"
        fi
        rm -f "$pidfile"
    else
        echo "[$agent] No PID file found"
    fi
done

echo "All agents stopped."
