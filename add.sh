#!/usr/bin/env bash

filedir="$HOME/alex/scripts/priority"
old_data=$(cat "$filedir/tasks.json")
length=$(jq '. | length' "$filedir/tasks.json" 2>/dev/null || echo 0)

# Ensure length is an integer
length=${length:-0}

if [ "$length" -ge 4 ]; then
  echo "You already have max number of project (4)"
  echo "--------------------------------"
  exit 0
fi


read -p "Enter the name of the project: " name
read -p "Enter the description of the project: " description


task_data=$(jq -n \
--arg name "$name" \
--arg description "$description" \
'{name: $name, description: $description}')

if [ -z "$old_data" ]; then
  echo "[$task_data]" > $filedir/tasks.json
else
  echo "$old_data" | jq ". + [$task_data]" > $filedir/tasks.json
fi
echo "Project added successfully"
  echo "--------------------------------"
