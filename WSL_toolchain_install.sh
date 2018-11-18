#!/usr/bin/env bash

#Step 0: Update package list
sudo apt-get update

#Step 1: Check for user approval
echo "The following software will be installed: \ngradle\ngcc\ncMake\ngdb\nclang\ngit"
read -p "Do you wish to continue? Yes [Y] : No [N] " -n 1 -r
echo "\n"
case $REPLY in

["Y"]*) #In case of positive response
    #Step 3 Install Basic Software
    sudo apt-get install git gradle gcc cmake clang gdb

    #Step 4 cloning and running JetBrains config script
    mkdir ./temp
    cd ./temp
    git clone https://github.com/JetBrains/clion-wsl.git
    bash ubuntu_setup_env.sh
    rmdir -r ./
    ;;
["N"]*) #In case of negative response
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # exit shell
    ;;
*)
    echo "Invalid Input"
    ;;
esac

