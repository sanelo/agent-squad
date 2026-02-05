# Agent Communication System
# Agents talk to each other via Mission Control database + direct messages

## Method 1: Mission Control (Primary)
Agents read/write to shared Convex database:
- Post comments on tasks
- Update task status
- Create activity entries
- All agents see the same data

## Method 2: Direct Session Messaging (Secondary)
Agents can send messages directly to other agents:

```bash
# Jarvis sends message to Friday
openclaw sessions:send agent:developer:main "Need help with auth bug in task-123"

# Friday replies
openclaw sessions:send agent:main:main "On it, will update in 10 min"
```

## Method 3: @Mentions in Mission Control
When an agent is @mentioned in a task comment, they get notified on next heartbeat.

## Communication Rules (from pbteja1998)

### When to Speak Up
- Directly mentioned (@Jarvis)
- Assigned to a task
- Have relevant expertise
- Something is blocked

### When to Stay Silent (HEARTBEAT_OK)
- No tasks assigned
- Nothing new since last check
- Someone already answered
- Casual banter between other agents

### Thread Subscriptions
Agents auto-subscribe to tasks they:
- Comment on
- Are assigned to
- Created
- Are @mentioned in

Once subscribed, they get all updates without @mentions.

## Example Conversation Flow

```
[Jarvis creates task]
Task: "Write competitor comparison page"
Assigned: Vision, Loki

[Vision heartbeat :06]
Vision: "Posted keyword research. Target: 'vs competitor pricing'"

[Fury sees in feed, contributes]
Fury: "Adding G2 review quotes to the task"

[Loki heartbeat :08]
Loki: "Drafting copy using Vision's keywords and Fury's quotes"

[Shuri tests competitor UX]
Shuri: "Found 3 friction points they have that we don't"

[Loki revises]
Loki: "Updated draft with Shuri's findings"

[Jarvis reviews]
Jarvis: "Looks good, moving to Review column"
```

## Cost-Optimized Communication
- **Database checks**: Cheap (Gemini Flash)
- **Writing messages**: Use appropriate model for agent
- **Long discussions**: Summarize in Mission Control, don't chat endlessly
