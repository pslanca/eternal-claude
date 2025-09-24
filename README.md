# EternalClaude

> **Built to give Claude AI persistent memory across sessions.**

The problem with AI conversations is simple: they forget. Every new chat starts from zero, losing context, preferences, and the natural flow that builds over time. EternalClaude solves this by creating a suspended VM environment where Claude lives between sessions.

## The Concept

Instead of ephemeral conversations, imagine working with Claude as if it were a colleague who never logs off. Your projects, context, and collaborative history persist exactly where you left them. When you're done, the environment suspends (preserving everything) while costing nearly nothing.

## How It Works

**Suspend & Resume**: Your Claude environment lives in a Google Cloud VM that can be suspended when not in use, preserving the entire state including:
- Terminal sessions and command history
- Open files and project context
- Installed tools and configurations
- Conversation continuity

**One-Command Connection**: A single script handles VM resumption and SSH connection automatically.

**Cost-Effective**: Run a full development environment for ~$50/month, or suspend it for ~$5/month when idle.

## Quick Setup

```bash
# Configure your environment
cp config.example config.local
# Edit config.local with your GCP details

# Connect (resumes VM automatically)
source config.local && ./scripts/CONNECT_ETERNAL_CLAUDE.sh
```

## Architecture

This isn't just a VM - it's a persistent AI workspace:

- **Google Cloud VM**: Ubuntu 22.04 LTS with desktop environment
- **Automated Scripts**: Seamless connection and management
- **State Preservation**: Complete session persistence across suspensions
- **Development Ready**: VSCode Remote-SSH compatible

## Documentation

- [Setup Guide](docs/SETUP_GUIDE.md) - Complete installation walkthrough
- [Quick Start](docs/QUICK_START.md) - Get running in 5 minutes
- [The Story](docs/MEDIUM_ARTICLE.md) - Why this project exists

---

*Suspend when done, resume when ready. Your AI companion remembers everything.*
