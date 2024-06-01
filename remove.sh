#!/usr/bin/env bash

filedir="$HOME/alex/scripts/priority"
echo "Removing a project"
echo "--------------------------------"

length=$(jq '. | length' $filedir/tasks.json)

for i in $(seq 0 $((length - 1))); do
  name=$(jq -r ".[$i].name" $filedir/tasks.json)
  echo "$((i + 1)): $name"
done

echo "--------"

read -p "Enter the number of the project you want to remove: " number

if [ $number -gt $length ]; then
  echo "Invalid number"
  exit 1
fi
# Remove the selected project
jq "del(.[$((number - 1))])" $filedir/tasks.json >$filedir/temp.json && mv $filedir/temp.json $filedir/tasks.json

echo "--------------------------------"
