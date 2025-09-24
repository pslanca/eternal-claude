# Quick Start

> Get your persistent Claude AI workspace running in 5 minutes.

## Before You Begin

You'll need:
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) installed locally
- A Google Cloud project with billing enabled
- Basic terminal comfort

## Create Your Persistent Workspace

**1. Set up the VM**
```bash
# Create Ubuntu 22.04 LTS instance (2 vCPU, 4GB RAM, 30GB disk)
# Configure SSH access with username 'claude'
# Optional: Install desktop environment for GUI access
```

**2. Configure EternalClaude**
```bash
git clone https://github.com/pslanca/eternal-claude.git
cd eternal-claude
cp config.example config.local
# Edit config.local with your GCP project details
```

**3. Connect to Your Persistent Claude**
```bash
source config.local
./scripts/CONNECT_ETERNAL_CLAUDE.sh
```

## Your New Workflow

**Start Working**: Run the connection script - it automatically resumes and connects
**Take a Break**: `gcloud compute instances suspend eternal-claude --zone=YOUR-ZONE`
**Resume Later**: Run the script again - everything exactly as you left it

The beauty is in the continuity. Your AI companion never forgets your projects, preferences, or where you left off.
