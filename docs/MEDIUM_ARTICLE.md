# Eternal Claude: From Blindness to Amnesia (and How I Fixed Both)

*A designer's journey from blind automation to visual understanding—with Figma and VS Code finally united*

---

It happened right in the middle of *FigmaVision* — the project where I taught AI to “see” its own designs.

Claude Code had just lost context, and I was groaning at the thought of re-explaining everything from scratch. As I began walking it back through the project, Claude suddenly said:

> *“Wait… your project is literally called FigmaVision, it’s about giving AI vision, and here I am saying I can’t see. The irony is perfect!”*

I froze, then laughed. The AI had nailed the absurdity: I was building tools to cure its blindness, while it was blind to the very designs in front of it.

That moment became the bridge. If *FigmaVision* was about sight, then the next frontier was memory. Because what I really needed wasn’t just an AI that could *see* — it was one that could *remember*.

That’s where *Eternal Claude* began.

---

## The Pain of Amnesia
Every session felt like déjà vu. Claude would forget everything once the tab closed or the session expired. Hours of shared context were wiped clean, leaving me to retype prompts like a frustrated ghostwriter.

It was like working with a brilliant colleague who had permanent short-term memory loss.

I needed persistence — a way for Claude to wake up tomorrow exactly where we left off yesterday.

---

## The Breakthrough
The solution was surprisingly simple: **suspend and resume a VM instead of starting from scratch each time**.

On Google Cloud, suspending a VM preserves the full memory state, just like closing your laptop lid. When you resume, everything comes back — terminal history, open files, running processes, conversation logs.

And here’s the kicker: it costs about **$5/month** when suspended. That’s the price of coffee for an AI that never forgets.

---

## Building Eternal Claude

### Step 1: Google Cloud Account
- Sign up at [cloud.google.com/free](https://cloud.google.com/free)
- Use the $300 free credit to get started

### Step 2: Create the VM
```bash
gcloud compute instances create eternal-claude   --zone=europe-west1-b   --machine-type=e2-medium   --image-family=ubuntu-2204-lts   --image-project=ubuntu-os-cloud   --boot-disk-size=30GB   --metadata=startup-script='#!/bin/bash
apt-get update
apt-get install -y xfce4 xfce4-goodies firefox-esr xrdp
systemctl enable xrdp'
```

### Step 3: SSH Access
```bash
gcloud auth login
gcloud config set project YOUR-PROJECT-NAME
gcloud compute ssh claude@eternal-claude --zone=YOUR-ZONE
```

### Step 4: Configure Desktop
```bash
sudo adduser claude
sudo usermod -aG sudo claude
sudo apt install -y xfce4 firefox-esr xrdp
sudo systemctl enable xrdp
```

### Step 5: Connect with VSCode
- Install Remote-SSH
- Add: `ssh claude@YOUR-EXTERNAL-IP`
- Connect and create a workspace:
```bash
mkdir eternal-conversation
cd eternal-conversation
echo "# My Eternal AI Workspace" > README.md
```

---

## Daily Workflow
```bash
# Start day
gcloud compute instances resume eternal-claude --zone=YOUR-ZONE

# End day
gcloud compute instances suspend eternal-claude --zone=YOUR-ZONE
```

Costs:
- Running: ~$25/month
- Suspended: ~$5/month
- Typical daily use: ~$5/month total

---

## Lessons Learned
- **IP changes** after suspend — fix with `gcloud compute instances describe`
- **Backups** are still good hygiene (`scp` to local)
- **Billing alerts** stop nasty surprises
- **Remote Desktop** works if you want a GUI with Firefox

---

## What Persistent Context Actually Enables

Here's a real example from my workflow:

**Day 1**: Claude and I start building a React component library. We discuss naming conventions, establish the file structure, and I show Claude my preferred coding patterns. Session ends.

**Traditional AI (Day 2)**:
> "I need help with the Button component"
>
> "What framework are you using? What's your file structure? What naming conventions do you prefer?"

**Eternal Claude (Day 2)**:
> "I need help with the Button component"
>
> "Perfect! Based on our component library structure from yesterday, I'll add it to `/src/components/Button/` following the pattern we established. Should I include the hover animations we discussed for the primary variant?"

The difference isn't just convenience—it's collaborative momentum. Claude becomes a project partner who builds on shared context instead of starting from zero every time.

---

## Why This Matters
With *FigmaVision*, I gave Claude "eyes." With *Eternal Claude*, I gave it a "mind that remembers."

Together, these projects sketch out the beginning of something bigger: AI that's not just reactive, but genuinely collaborative.

---

## Try It Yourself

The complete EternalClaude setup is available on GitHub:
**[github.com/pslanca/eternal-claude](https://github.com/pslanca/eternal-claude)**

Includes:
- Automated connection scripts
- Configuration templates
- Complete setup documentation
- The exact workflow I use daily

It takes about 5 minutes to get your persistent AI workspace running.

---

## Closing
If *FigmaVision* was about curing blindness, *Eternal Claude* is about curing amnesia.

Both projects grew out of late-night frustration, experiments, and one perfectly timed joke from Claude itself.

Because sometimes the most human part of working with AI isn't the code — it's when the AI makes you laugh at your own project's name.
