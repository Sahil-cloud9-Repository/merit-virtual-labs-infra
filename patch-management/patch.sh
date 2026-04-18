#!/bin/bash
yum update -y
yum upgrade -y

# GPU drivers check (important for Merit)
nvidia-smi || echo "GPU driver check failed"

reboot