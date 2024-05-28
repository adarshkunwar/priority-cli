#!/usr/bin/env bash

echo "Add a project"
echo "--------------------------------"
if [ ! -f tasks.json ]; then
  touch ~/codes/bash/priority/tasks.json
fi
old_data=$(cat ~/codes/bash/priority/tasks.json)
length=$(jq '. | length' ~/codes/bash/priority/tasks.json)
if [ $length -gt 3 ]; then
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
  echo "[$task_data]" > ~/codes/bash/priority/tasks.json
else
  echo "$old_data" | jq ". + [$task_data]" > ~/codes/bash/priority/tasks.json
fi
echo "Project added successfully"
  echo "--------------------------------"
