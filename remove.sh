#!/usr/bin/env bash

echo "Removing a project"
echo "--------------------------------"

length=$(jq '. | length' tasks.json)

for i in $(seq 0 $((length - 1))); do
  name=$(jq -r ".[$i].name" tasks.json)
  echo "$((i+1)): $name"
done

echo "--------"

read -p "Enter the number of the project you want to remove: " number

if [ $number -gt $length ]; then
  echo "Invalid number"
  exit 1
fi
# Remove the selected project
jq "del(.[$((number - 1))])" tasks.json > temp.json && mv temp.json tasks.json

echo "--------------------------------"
