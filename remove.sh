#!/usr/bin/env bash

echo "Removing a project"
echo "--------------------------------"

length=$(jq '. | length' ~/codes/bash/priority/tasks.json)

for i in $(seq 0 $((length - 1))); do
  name=$(jq -r ".[$i].name" ~/codes/bash/priority/tasks.json)
  echo "$((i+1)): $name"
done

echo "--------"

read -p "Enter the number of the project you want to remove: " number

if [ $number -gt $length ]; then
  echo "Invalid number"
  exit 1
fi
# Remove the selected project
jq "del(.[$((number - 1))])" ~/codes/bash/priority/tasks.json > ~/codes/bash/priority/temp.json && mv ~/codes/bash/priority/temp.json ~/codes/bash/priority/tasks.json

echo "--------------------------------"
