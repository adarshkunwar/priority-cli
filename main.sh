#!/usr/bin/env bash 

check_projects(){
  echo "Checking the list of projects"
  echo "--------------------------------"
  rm -f tasks.json
  ls -lah

  echo "--------------------------------"
}

remove_project(){
  echo "Removing a project"
  echo "--------------------------------"

  echo "--------------------------------"
}

add_project(){
  echo "Add a project"
  echo "--------------------------------"

  
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
}

close_priority(){
  echo "Closing priority"
  echo "--------------------------------"
  exit 0
  echo "--------------------------------"
}

main(){
  clear
cat <<EOF
             _            _ _         
            (_)          (_) |        
  _ __  _ __ _  ___  _ __ _| |_ _   _ 
  | '_ \| '__| |/ _ \| '__| | __| | | |
  | |_) | |  | | (_) | |  | | |_| |_| |
  | .__/|_|  |_|\___/|_|  |_|\__|\__, |
  | |                             __/ |
  |_|                            |___/ 


EOF

  echo "What do you want to do?"
  echo "c. check the list of projects"
  echo "r. Remove a project"
  echo "a. add a project"
  echo "p. close priority"

  read -p "Enter your choice: " choice

  case $choice in
    c)
      check_projects
      ;;
    r)
      remove_project
      ;;
    a)
      add_project
      ;;
    p)
      close_priority
      ;;
    *)
      echo "Invalid choice"
      ;;
  esac
}

main
