#!/bin/bash
# Start all agents with staggered timing
# Run: ./start-agents.sh

echo "Starting AI Agent Squad..."

# Function to start an agent
start_agent() {
    local name=$1
    local session=$2
    local delay=$3
    
    echo "[$name] Starting in ${delay}s..."
    (
        sleep $delay
        cd ~/.openclaw/workspace
        openclaw agent:start \
            --config agents/$name/openclaw.json \
            --session $session \
            > agents/$name/agent.log 2>&1 &
        echo $! > agents/$name/agent.pid
        echo "[$name] Started with PID $(cat agents/$name/agent.pid)"
    )
}

# Start agents with staggered delays (avoid simultaneous API calls)
start_agent "jarvis"   "agent:main:main"              0
start_agent "shuri"    "agent:product-analyst:main"   5
start_agent "fury"     "agent:customer-researcher:main" 10
start_agent "vision"   "agent:seo-analyst:main"       15
start_agent "loki"     "agent:content-writer:main"    20
start_agent "friday"   "agent:developer:main"         25

echo ""
echo "All agents starting. Check individual logs in agents/{name}/agent.log"
echo "To stop all: ./stop-agents.sh"
