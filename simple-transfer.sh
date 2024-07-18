#!/bin/bash

# Define log file
LOG_FILE="logs/simple-transfer.log"

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Check if COIN_ID is provided as an argument
if [ $# -eq 0 ]; then
    log_message "Error: COIN_ID not provided"
    log_message "Usage: $0 <COIN_ID>"
    exit 1
fi

# Define variables
COIN_ID="$1"
BOB_ADDRESS="0x7894f6cc9b70049caa266e6230545013bacd03812a80926bce324fed63ddf92c"
GAS_BUDGET=1000000000

log_message "Starting transfer process"
log_message "COIN_ID: $COIN_ID"
log_message "Recipient Address: $BOB_ADDRESS"
log_message "Gas Budget: $GAS_BUDGET"

# Execute the transfer command
sui client pay-sui \
  --input-coins $COIN_ID \
  --recipients $BOB_ADDRESS \
  --amounts 100 \
  --gas-budget $GAS_BUDGET 2>&1 | tee -a "$LOG_FILE"

# Check if the command was successful
if [ $? -eq 0 ]; then
    log_message "Transfer to Bob successful!"
else
    log_message "Transfer failed. Please check your inputs and try again."
fi

log_message "Transfer process completed"
