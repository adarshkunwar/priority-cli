#!/usr/bin/env bash


  echo "Checking the list of projects"
  echo "--------------------------------"
  
  if [ ! -f tasks.json ]; then
    echo "No projects found"
    echo "--------------------------------"
    exit 0
  fi

  lentgh=$(jq '. | length' tasks.json)

  for i in $(seq 0 $((lentgh - 1))); do
    name=$(jq -r ".[$i].name" tasks.json)
    echo "$((i+1)): $name"
  done

  echo "-------"

  echo "Select the operation you want to perform"
  echo "c. Check a project in detail"
  echo "u. Update the status of a project"
  echo "e. Exit Priotity"

  echo "-------"
  read -p "Enter your choice: " choice

  case $choice in
    c) 
      echo "enter the number of the project you want to check"
      read chosenNumber;
      
      projectNumber=$((chosenNumber-1)) 
      name=$(jq -r ".[$projectNumber].name" tasks.json)
      description=$(jq -r ".[$projectNumber].description" tasks.json)
  
      echo "Project name: $name"
      echo "Project description: $description"

      ;;
    u)
      
      echo "update"
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
