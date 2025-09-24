#!/bin/bash
# Eternal Claude Connect Script
# Resumes a Google Cloud VM, fetches its external IP, and opens an SSH session.
# Usage: ./CONNECT_ETERNAL_CLAUDE.sh

PROJECT=${PROJECT:-your-project-id}
ZONE=${ZONE:-europe-west1-b}
VM=${VM:-eternal-claude}

echo "Resuming VM $VM in $ZONE..."
gcloud compute instances resume $VM --zone=$ZONE --project=$PROJECT

echo "Fetching external IP..."
IP=$(gcloud compute instances describe $VM   --zone=$ZONE --project=$PROJECT   --format="value(networkInterfaces[0].accessConfigs[0].natIP)")

if [ -z "$IP" ]; then
  echo "Error: Could not retrieve external IP. Check VM status."
  exit 1
fi

echo "Connecting to $IP..."
ssh claude@$IP
