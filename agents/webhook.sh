#!/bin/bash
# Mission Control Webhook Integration
# Agents use this to report status, create tasks, post comments

CONVEX_URL="${CONVEX_URL:-http://127.0.0.1:3210}"
WEBHOOK_SECRET="${WEBHOOK_SECRET:-dev-secret}"

# Report heartbeat status
report_status() {
    local session_key=$1
    local status=$2  # idle, active, blocked
    local message=$3
    
    curl -s -X POST "$CONVEX_URL/api/webhook" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $WEBHOOK_SECRET" \
        -d "{
            \"sessionKey\": \"$session_key\",
            \"action\": \"heartbeat\",
            \"payload\": {
                \"status\": \"$status\",
                \"message\": \"$message\"
            }
        }" | jq -r '.success'
}

# Create a new task
create_task() {
    local session_key=$1
    local title=$2
    local description=$3
    
    curl -s -X POST "$CONVEX_URL/api/webhook" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $WEBHOOK_SECRET" \
        -d "{
            \"sessionKey\": \"$session_key\",
            \"action\": \"task.create\",
            \"payload\": {
                \"title\": \"$title\",
                \"description\": \"$description\"
            }
        }" | jq -r '.taskId'
}

# Update task status
update_task() {
    local session_key=$1
    local task_id=$2
    local status=$3  # inbox, assigned, in_progress, review, done, blocked
    
    curl -s -X POST "$CONVEX_URL/api/webhook" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $WEBHOOK_SECRET" \
        -d "{
            \"sessionKey\": \"$session_key\",
            \"action\": \"task.update\",
            \"payload\": {
                \"taskId\": \"$task_id\",
                \"status\": \"$status\"
            }
        }" | jq -r '.success'
}

# Post comment on task
post_comment() {
    local session_key=$1
    local task_id=$2
    local content=$3
    
    curl -s -X POST "$CONVEX_URL/api/webhook" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $WEBHOOK_SECRET" \
        -d "{
            \"sessionKey\": \"$session_key\",
            \"action\": \"message.create\",
            \"payload\": {
                \"taskId\": \"$task_id\",
                \"content\": \"$content\"
            }
        }" | jq -r '.messageId'
}

# Usage examples:
# ./webhook.sh report_status agent:main:main active "Working on dashboard"
# ./webhook.sh create_task agent:main:main "New feature" "Description here"
# ./webhook.sh update_task agent:main:main task-123 in_progress
# ./webhook.sh post_comment agent:main:main task-123 "This looks good"

case "$1" in
    report_status)
        report_status "$2" "$3" "$4"
        ;;
    create_task)
        create_task "$2" "$3" "$4"
        ;;
    update_task)
        update_task "$2" "$3" "$4"
        ;;
    post_comment)
        post_comment "$2" "$3" "$4"
        ;;
    *)
        echo "Usage: $0 {report_status|create_task|update_task|post_comment} [args...]"
        exit 1
        ;;
esac
