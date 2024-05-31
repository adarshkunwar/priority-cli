#!/usr/bin/env bash

echo $pwd

filedir='~/alex/scripts/priority/'
echo " I N S T A L L I N G    D E P E N D E N C I E S "
sudo pacman -Syu jq

echo " C R E A T I N G   D I R E C T O R I E S "
if [ ! -d $filedir ]; then
  mkdir -p $filedir
fi

echo " C R E A T I N G   S Y M L I N K "
ln -s $PWD/add.sh $filedir/add.sh 
ln -s $PWD/main.sh $filedir/main.sh
ln -s $PWD/check.sh $filedir/check.sh
ln -s $PWD/remove.sh $filedir/remove.sh

echo "C R E A T I N G   T A S K S . J S O N"
touch $filedir/tasks.json 

echo "C R E A T I N G   A L I A S"
echo "alias priority=$filedir/main.sh" >> check.txt

echo "I N S T A L L A T I O N   C O M P L E T E"
