# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

EternalClaude is an infrastructure project that creates a persistent Claude AI environment using Google Cloud VMs. The project allows suspending and resuming VM instances to maintain session context while keeping costs low (~$5/month when suspended).

## Commands

### VM Management
- **Resume and connect to VM**: `./scripts/CONNECT_ETERNAL_CLAUDE.sh`
- **Suspend VM**: `gcloud compute instances suspend eternal-claude --zone=YOUR-ZONE`
- **Resume VM manually**: `gcloud compute instances resume eternal-claude --zone=YOUR-ZONE --project=YOUR-PROJECT`

### Connection
- **SSH to VM**: `ssh claude@[VM-EXTERNAL-IP]` (after running connect script)

## Project Structure

```
EternalClaude/
├── docs/              # Documentation and guides
│   ├── QUICK_START.md     # Quick setup instructions
│   ├── SETUP_GUIDE.md     # Detailed setup guide
│   └── MEDIUM_ARTICLE.md  # Project background article
├── scripts/           # Automation scripts
│   └── CONNECT_ETERNAL_CLAUDE.sh  # Main connection script
├── assets/           # Project assets and media
└── README.md         # Project overview
```

## Architecture

This is primarily an infrastructure/documentation project with minimal code:

- **Shell Scripts**: Located in `scripts/` for VM automation
- **Documentation**: Comprehensive guides in `docs/` for setup and usage
- **No traditional build process**: This is an infrastructure template, not a software application

## Key Configuration

The `CONNECT_ETERNAL_CLAUDE.sh` script uses environment variables:
- `PROJECT`: GCP project ID (default: your-project-id)
- `ZONE`: GCP zone (default: europe-west1-b)
- `VM`: VM instance name (default: eternal-claude)

## Development Notes

- This project creates a Google Cloud VM environment for running Claude AI persistently
- The VM should be configured with Ubuntu 22.04 LTS (2 vCPU, 4GB RAM, 30GB disk)
- VSCode Remote-SSH is the recommended development environment
- No package managers or build tools are required for the core project