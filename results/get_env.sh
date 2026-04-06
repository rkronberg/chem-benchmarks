#!/bin/bash

MODULE="$1"
SYSTEM="$2"

if [[ -z "$MODULE" || -z "$SYSTEM" ]]; then
    echo "Usage: $0 <module_name> <system>"
    exit 1
fi

MODULE_NAME="${MODULE%%/*}"
MODULE_VERSION="${MODULE##*/}"
OUTPUT_FILE="${MODULE_NAME}/modules/${SYSTEM}-${MODULE_VERSION}.lua"

if module load "$MODULE" 2>/dev/null; then
    echo "Writing environment to: $OUTPUT_FILE"
    module tablelist &> "$OUTPUT_FILE"
else
    echo "Failed to load module '$MODULE'."
    exit 2
fi
