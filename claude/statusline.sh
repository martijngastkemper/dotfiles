#!/bin/sh

# Read JSON data that Claude Code sends to stdin
input=$(cat)


# Extract fields using jq
MODEL=$(echo "$input" | jq -r '.model.display_name')

# The "// 0" provides a fallback if the field is null
PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)

# Output the status line - ${DIR##*/} extracts just the folder name
echo "[$MODEL] ${PCT}% context"
