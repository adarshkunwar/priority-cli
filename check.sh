#!/usr/bin/env bash


filedir="$HOME/alex/scripts/priority"
  echo "Checking the list of projects"
  echo "--------------------------------"

  length=$(jq '. | length' $filedir/tasks.json)

  for i in $(seq 0 $((length - 1))); do
    name=$(jq -r ".[$i].name" $filedir/tasks.json)
    echo "$((i+1)): $name"
  done

  echo "-------"

  echo "Select the operation you want to perform"
  echo "c. Check a project in detail"
  echo "u. Update the status of a project"
  echo "e. Exit Priority"

  echo "-------"
  read -p "Enter your choice: " choice

  case $choice in
      # TODO: Implement the update functionality
    c) 
      echo "enter the number of the project you want to check"
      read chosenNumber;
      
      projectNumber=$((chosenNumber-1)) 
      name=$(jq -r ".[$projectNumber].name" $filedir/tasks.json)
      description=$(jq -r ".[$projectNumber].description" $filedir/tasks.json)
      status=$(jq -r ".[$projectNumber].status" $filedir/tasks.json)  

      echo "Project name: $name"
      echo "Project description: $description"
      echo "Project status: $status"
      ;;
    u)
      # TODO: Implement the update functionality
      echo "Enter the number of the project you want to check"
      read chosenNumber

      projectNumber=$((chosenNumber-1))
      name=$(jq -r ".[$projectNumber].name" $filedir/tasks.json)
      description=$(jq -r ".[$projectNumber].description" $filedir/tasks.json)
      status=$(jq -r ".[$projectNumber].status" $filedir/tasks.json)

      echo "Project Name: $name"
      echo "Description: $description"
      echo "Current Status: $status"
      read -p "What is the current status? " current_status

      # Update the status in the tasks.json file
      jq --argjson index "$projectNumber" --arg status "$current_status" '
        .[$index].status = $status
      ' $filedir/tasks.json > $filedir/temp.json && mv $filedir/temp.json $filedir/tasks.json

      echo "Status updated successfully!"
      ;;
    e)
      echo "exiting"
      exit 0
      ;;
    *)
      echo "Invalid choice"
      ;;
  esac
  echo "--------------------------------"
