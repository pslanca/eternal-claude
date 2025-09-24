#!/bin/bash
# Eternal Claude Connect Script
# Resumes a Google Cloud VM, fetches its external IP, and opens an SSH session.
# Usage: ./CONNECT_ETERNAL_CLAUDE.sh

set -e  # Exit on any error

# Configuration with defaults
PROJECT=${PROJECT:-your-project-id}
ZONE=${ZONE:-europe-west1-b}
VM=${VM:-eternal-claude}
USER=${USER:-claude}

# Validate required tools
if ! command -v gcloud &> /dev/null; then
    echo "Error: gcloud CLI not found. Please install Google Cloud SDK."
    echo "Visit: https://cloud.google.com/sdk/docs/install"
    exit 1
fi

# Check if user needs to configure variables
if [ "$PROJECT" = "your-project-id" ]; then
    echo "Warning: Please set your PROJECT variable:"
    echo "   export PROJECT=your-actual-project-id"
    echo "   ./scripts/CONNECT_ETERNAL_CLAUDE.sh"
    exit 1
fi

echo "Resuming VM '$VM' in zone '$ZONE'..."
if ! gcloud compute instances resume "$VM" --zone="$ZONE" --project="$PROJECT" 2>/dev/null; then
    echo "Info: VM might already be running or doesn't exist."
fi

echo "Fetching external IP..."
IP=$(gcloud compute instances describe "$VM" \
    --zone="$ZONE" \
    --project="$PROJECT" \
    --format="value(networkInterfaces[0].accessConfigs[0].natIP)")

if [ -z "$IP" ]; then
    echo "Error: Could not retrieve external IP."
    echo "   Check that VM '$VM' exists and has an external IP assigned."
    exit 1
fi

echo "VM is ready at IP: $IP"
echo "Connecting via SSH..."
ssh "$USER@$IP"
