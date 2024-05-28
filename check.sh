#!/usr/bin/env bash


  echo "Checking the list of projects"
  echo "--------------------------------"
  
  if [ ! -f tasks.json ]; then
    echo "No projects found"
    echo "--------------------------------"
    exit 0
  fi

  length=$(jq '. | length' tasks.json)

  for i in $(seq 0 $((length - 1))); do
    name=$(jq -r ".[$i].name" tasks.json)
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
      name=$(jq -r ".[$projectNumber].name" tasks.json)
      description=$(jq -r ".[$projectNumber].description" tasks.json)
      status=$(jq -r ".[$projectNumber].status" tasks.json)  

      echo "Project name: $name"
      echo "Project description: $description"
      echo "Project status: $status"
      ;;
    u)
      # TODO: Implement the update functionality
      echo "Enter the number of the project you want to check"
      read chosenNumber

      projectNumber=$((chosenNumber-1))
      name=$(jq -r ".[$projectNumber].name" tasks.json)
      description=$(jq -r ".[$projectNumber].description" tasks.json)
      status=$(jq -r ".[$projectNumber].status" tasks.json)

      echo "Project Name: $name"
      echo "Description: $description"
      echo "Current Status: $status"
      read -p "What is the current status? " current_status

      # Update the status in the tasks.json file
      jq --argjson index "$projectNumber" --arg status "$current_status" '
        .[$index].status = $status
      ' tasks.json > temp.json && mv temp.json tasks.json

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
