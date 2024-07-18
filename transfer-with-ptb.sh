#!/bin/bash

# Define log file
LOG_FILE="logs/transfer-with-ptb.log"

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Define variables
BOB_ADDRESS="0x7894f6cc9b70049caa266e6230545013bacd03812a80926bce324fed63ddf92c"
GAS_BUDGET=1000000000
TRANSFER_COUNT=500
TRANSFER_AMOUNT=100

log_message "Starting transfer process"
log_message "Recipient Address: $BOB_ADDRESS"
log_message "Gas Budget: $GAS_BUDGET"
log_message "Number of transfers: $TRANSFER_COUNT"
log_message "Amount per transfer: $TRANSFER_AMOUNT"

# Prepare the command
CMD="sui client ptb --gas-budget $GAS_BUDGET --assign to_address @$BOB_ADDRESS"

# Build the repeated part of the command
for ((i=1; i<=$TRANSFER_COUNT; i++)); do
    CMD+=" --split-coins gas \"[$TRANSFER_AMOUNT]\" --assign new_coins --transfer-objects \"[new_coins.0]\" to_address"
done

# Execute the transfer command
eval $CMD 2>&1 | tee -a "$LOG_FILE"

# Check if the command was successful
if [ $? -eq 0 ]; then
    log_message "Transfer to Bob successful!"
else
    log_message "Transfer failed. Please check your inputs and try again."
fi

log_message "Transfer process completed"
