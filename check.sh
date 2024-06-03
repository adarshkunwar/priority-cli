#!/usr/bin/env bash

filedir="$HOME/alex/scripts/priority"

echo "-------"
read -p "Chose a project number: " chosenNumber

echo "-------"
projectNumber=$((chosenNumber - 1))
name=$(jq -r ".[$projectNumber].name" $filedir/tasks.json)
description=$(jq -r ".[$projectNumber].description" $filedir/tasks.json)
status=$(jq -r ".[$projectNumber].status" $filedir/tasks.json)

echo "Project name: $name"
echo "Project description: $description"
echo "Project status: $status"

echo "-------"
echo "Select the operation you want to perform"
echo "u. Update the status"
echo "r. Remove the project"
echo "e. Exit Priority"

echo "-------"
read -p "Enter your choice: " choice

case $choice in
u)
  read -p "What is the current status? " current_status

  # Update the status in the tasks.json file
  jq --argjson index "$projectNumber" --arg status "$current_status" '
        .[$index].status = $status
      ' $filedir/tasks.json >$filedir/temp.json && mv $filedir/temp.json $filedir/tasks.json

  echo "Task status updated successfully!"
  ;;

r)
  jq "del(.[$projectNumber])" $filedir/tasks.json >$filedir/temp.json && mv $filedir/temp.json $filedir/tasks.json

  echo "Task removed successfully"
  ;;

e)
  echo "-------"
  echo "exiting"
  exit 0
  ;;
*)
  echo "-------"
  echo "Invalid choice"
  exit 0
  ;;
esac
echo "--------------------------------"
