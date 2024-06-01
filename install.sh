#!/usr/bin/env bash

filedir="$HOME/alex/scripts/priority"

echo " I N S T A L L I N G    D E P E N D E N C I E S "
if pacman -Qi jq &>/dev/null; then
  echo "jq is already installed"
else
  echo "installing jq"
  sudo pacman -S jq
fi

echo " C R E A T I N G   D I R E C T O R I E S "
if [ ! -d $filedir ]; then
  mkdir -p $filedir
fi

echo " C R E A T I N G   S Y M L I N K "
ln $PWD/add.sh $filedir/add.sh
ln $PWD/main.sh $filedir/main.sh
ln $PWD/check.sh $filedir/check.sh
ln $PWD/remove.sh $filedir/remove.sh

echo "C R E A T I N G   T A S K S . J S O N"
touch $filedir/tasks.json

echo "C R E A T I N G   A L I A S"
echo "alias priority=$filedir/main.sh" >>~/.zshrc
echo "alias priority=$filedir/main.sh" >>~/.bashrc

echo "I N S T A L L A T I O N   C O M P L E T E"
echo "-----------------------------------------"
echo "you can now run the command 'priority' on bash or zsh shell to use the script"
