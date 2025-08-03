#!/bin/bash

# Configuration file for automated CLI tool dashboard

# Define colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Define dashboard sections
declare -A sections
sections["System Info"]="system_info.sh"
sections["Network Stats"]="network_stats.sh"
sections["Disk Usage"]="disk_usage.sh"
sections["CPU Monitoring"]="cpu_monitoring.sh"

# Define functions for each section
function system_info {
  echo -e "${GREEN}System Information:${NC}"
  uname -a
  hostname
  uptime
}

function network_stats {
  echo -e "${GREEN}Network Statistics:${NC}"
  ip link show
  ip addr show
}

function disk_usage {
  echo -e "${GREEN}Disk Usage:${NC}"
  df -h
}

function cpu_monitoring {
  echo -e "${GREEN}CPU Monitoring:${NC}"
  top -b -n 1 | head -10
}

# Main function to display dashboard
function dashboard {
  clear
  echo -e "${RED}Automated CLI Tool Dashboard${NC}"
  echo "---------------------------"
  for section in "${!sections[@]}"; do
    echo -e "${Green}$section${NC}"
    ./${sections[$section]}
    echo
  done
}

# Run the dashboard
dashboard