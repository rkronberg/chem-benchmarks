#!/bin/bash

MODULE="$1"
HOST="$2"

if [[ -z "$MODULE" || -z "$HOST" ]]; then
    echo "Usage: $0 <module_name> <host>"
    exit 1
fi

OUTPUT_FILE="modules/${MODULE}-${HOST}.lua"

if module load "$MODULE" 2>/dev/null; then
    echo "Writing environment to: $OUTPUT_FILE"
    module tablelist &> "$OUTPUT_FILE"
else
    echo "Failed to load module '$MODULE'."
    exit 2
fi
