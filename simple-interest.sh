#!/usr/bin/env bash
# Simple Interest Calculator
set -u

read_number() {
  local prompt="$1" value
  while true; do
    read -r -p "$prompt" value
    if [[ "$value" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
      printf '%s' "$value"
      return
    fi
    echo "Please enter a valid non-negative number." >&2
  done
}

echo "=== Simple Interest Calculator ==="
principal=$(read_number "Enter principal amount: ")
rate=$(read_number "Enter annual rate of interest (%): ")
time=$(read_number "Enter time period (years): ")

awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN {
  interest = p * r * t / 100
  printf "\nSimple Interest: %.2f\nTotal Amount: %.2f\n", interest, p + interest
}'
