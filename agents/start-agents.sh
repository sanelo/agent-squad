#!/bin/bash
# Start all agents using sessions_spawn
# Each agent runs as an isolated session with their own config

echo "Starting AI Agent Squad..."

WORKSPACE=/home/sanelo/.openclaw/workspace

# Function to start an agent
start_agent() {
    local name=$1
    local session=$2
    local delay=$3
    local config="$WORKSPACE/agents/$name/openclaw.json"
    
    echo "[$name] Starting in ${delay}s..."
    (
        sleep $delay
        
        # Create agent workspace if needed
        mkdir -p "$WORKSPACE/agents/$name/memory"
        
        # Spawn isolated session via OpenClaw
        # Note: This requires the sessions_spawn tool or manual session creation
        echo "[$name] Session: $session"
        echo "[$name] Config: $config"
        echo "[$name] Started at $(date)" > "$WORKSPACE/agents/$name/agent.log"
        
        # The actual session would be created via:
        # openclaw sessions:spawn --config "$config" --session "$session"
        # For now, we document the intended session key
    )
}

# Start agents with staggered delays
start_agent "jarvis"   "agent:main:main"              0
start_agent "shuri"    "agent:product-analyst:main"   5
start_agent "fury"     "agent:customer-researcher:main" 10
start_agent "vision"   "agent:seo-analyst:main"       15
start_agent "loki"     "agent:content-writer:main"    20
start_agent "friday"   "agent:developer:main"         25

echo ""
echo "Agent sessions prepared."
echo ""
echo "IMPORTANT: OpenClaw requires manual session creation."
echo "Each agent needs to be started in a separate terminal:"
echo ""
echo "Terminal 1: openclaw --session agent:main:main"
echo "Terminal 2: openclaw --session agent:product-analyst:main"
echo "...etc"
echo ""
echo "Or use the cron jobs to wake agents periodically."
