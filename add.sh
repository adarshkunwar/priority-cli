#!/usr/bin/env bash

echo "Add a project"
echo "--------------------------------"
length=$(jq '. | length' tasks.json)
if [ $length -gt 3 ]; then
  echo "You already have max number of project (4)"
  echo "--------------------------------"
  exit 0
fi

read -p "Enter the name of the project: " name
read -p "Enter the description of the project: " description

if [ ! -f tasks.json ]; then
  touch tasks.json
fi
old_data=$(cat tasks.json)

task_data=$(jq -n \
--arg name "$name" \
--arg description "$description" \
'{name: $name, description: $description}')

if [ -z "$old_data" ]; then
  echo "[$task_data]" > tasks.json
else
  echo "$old_data" | jq ". + [$task_data]" > tasks.json
fi
echo "Project added successfully"
  echo "--------------------------------"
