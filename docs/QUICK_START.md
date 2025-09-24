# Quick Start

1. Create a Google Cloud project and enable Compute Engine.
2. Spin up a VM with Ubuntu 22.04 LTS (2 vCPU, 4GB RAM).
3. Clone this repo.
4. Run `scripts/CONNECT_ETERNAL_CLAUDE.sh` to resume and connect.
5. Suspend when done:
   ```bash
   gcloud compute instances suspend eternal-claude --zone=YOUR-ZONE
   ```
