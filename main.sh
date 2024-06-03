#!/usr/bin/env bash

clear
filedir="$HOME/alex/scripts/priority"
cat <<EOF
             _            _  _         
            (_)          (_)| |        
   _ __  _ __ _  ___  _ __ _| |_ _   _ 
  | '_ \| '__| |/ _ \| '__| | __| | | |
  | |_) | |  | | (_) | |  | | |_| |_| |
  | .__/|_|  |_|\___/|_|  |_|\__|\__, |
  | |                             __/ |
  |_|                            |___/ 


EOF

# run the existing projects

filedir="$HOME/alex/scripts/priority"
echo "Checking the list of projects"

echo "--------------------------------"

length=$(jq '. | length' $filedir/tasks.json)

for i in $(seq 0 $((length - 1))); do
  name=$(jq -r ".[$i].name" $filedir/tasks.json)
  echo "$((i + 1)): $name"
done

echo "--------------------------------"

echo "What do you want to do?"
echo "a. Add a project"
echo "c. Check a project"
echo "e. Exit priority"

echo "-------"
read -p "Enter your choice: " choice

case $choice in
a)
  source $filedir/add.sh
  ;;
c)
  source $filedir/check.sh
  ;;
e)
  echo "Closing priority"
  echo "-------"
  exit 0
  ;;
*)
  echo "Invalid choice"
  echo "-------"
  exit 0
  ;;
esac
