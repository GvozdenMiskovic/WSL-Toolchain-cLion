#!/usr/bin/env bash

#Step 0: Update package list
sudo apt-get update

#Step 1: Check for user approval
echo "The following software will be installed: gradle \gcc \cMake \gdb \clang \build-essential \git"
read -p "Do you wish to continue? Yes [Y] : No [N] " -n 1 -r
echo "\n"
case $REPLY in
["Y"]*)                                                                     #In case of positive response
    #Step 3 Install Basic Software
    sudo apt-get install gradle gcc cmake gdb clang build-essential git

    #Step 4 cloning and running JetBrains config script
    git clone https://github.com/JetBrains/clion-wsl.git
    bash clion-wsl/ubuntu_setup_env.sh
    rm -r ./clion-wsl
    ;;
["N"]*)                                                                     #In case of negative response
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1                       #Exit shell
    ;;
*)
    echo "Invalid Input"
    ;;
esac

