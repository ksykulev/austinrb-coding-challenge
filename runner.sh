#!/bin/bash

  # Find all main.rb files in answers subdirectories and run command on each
  find answers -name "main.rb" -path "answers/*/main.rb" | while read -r file; do
      folder=$(basename "$(dirname "$file")")
      echo "Processing: $folder/$file"

      # Replace 'your_command' with the actual command you want to run
      ruby testharness "answers/$folder/$file"

      # Example: ruby "$file"
      # Example: cat "$file"
      # Example: rubocop "$file"
  done
