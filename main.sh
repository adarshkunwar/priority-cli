#!/usr/bin/env bash 

check_projects(){
  echo "Checking the list of projects"
  echo "--------------------------------"

  echo "--------------------------------"
}

remove_project(){
  echo "Removing a project"
  echo "--------------------------------"

  echo "--------------------------------"
}

update_project(){
  echo "Updating a project"
  echo "--------------------------------"

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
  echo "a. update a project"
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
      update_project
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
