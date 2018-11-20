#!/bin/bash
set -e # If any command fails, stop execution with that error

# Step 0 Check if root is running the script
if [ "$(id -u)" != "0" ]; then
	echo "Sorry, you are not root."
	exit 1
fi

# Step 1: Check for user approval
# Bash tips: echo output with colour
# http://fibrevillage.com/scripting/98-bash-tips-echo-output-with-colour
echo -e "The following software will be installed: \e[1;34mgradle gcc cMake gdb clang build-essential git\e[0m"

read -p "Do you wish to continue? Yes [y] : No [n] Defaults to Yes " -n 4 -r RESPONSE

if [[ "${RESPONSE// }" =~ [yY](es)* ]] || [[ -z "${RESPONSE// }" ]]
 then
    #Step 1: Update package list
    apt update
    #Step 2 Install Basic Software
    apt -y install gradle git # assume yes to all questions
    # Step 3 Download JetBrains script
    wget https://raw.githubusercontent.com/JetBrains/clion-wsl/master/ubuntu_setup_env.sh
    # Step 4 Run JetBrains script
    bash ubuntu_setup_env.sh
    # Step 5 Remove JetBrains script
    rm ubuntu_setup_env.sh
elif [[ "${RESPONSE// }" =~ [nN](o)* ]]
 then
   echo -e "\e[0;32mYou could change your mind and run this script again at any time.\e[0m"
else
    echo -e "\e[0;31mInvalid inptu!\e[0m"
    exit 1
fi
