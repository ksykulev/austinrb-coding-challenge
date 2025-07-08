#!/bin/bash

  # Find all main.rb files in answers subdirectories and run command on each
  find answers -name "main.rb" -path "answers/*/main.rb" | while read -r file; do
      folder=$(basename "$(dirname "$file")")
      echo "Processing: $file"

      # Replace 'your_command' with the actual command you want to run
      ruby testharness.rb "$file"
      echo ""
      echo ""
      echo ""
  done
