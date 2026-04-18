#!/bin/bash
yum update -y
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config