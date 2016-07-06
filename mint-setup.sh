#!/bin/bash

MY_SHELL="zsh"
ZSH_THEME="bureau"
MY_PROGRAMS="gcc g++ clang python3-pip wget gparted"

echo -e "\n\e[32mWelcome to the Linux Mint setup script\n"

read -n 1 -p "Should your system be updated? (Y/n): " answer

if [ "$answer" == "y" ] || [ "$answer" == "Y" ] || [ "$answer" == "" ] ; then
  echo -e "\e[32mUpdating system...\e[39m"
  sudo apt-get update
  echo -e "\n\e[32mUpgrading system...\e[39m"
  sudo apt-get upgrade
fi

echo -e "\n\e[32mInstalling my standard programs...\e[39m"
sudo apt-get install $MY_PROGRAMS $MY_SHELL

echo -e "\n\e[32mInstalling \e[34moh-my-zsh\e[32m...\e[39m"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# After installing oh-my-zsh enter "exit" otherwise the installation won't continue!

echo -e "\n\e[32mAppling zsh theme...\e[39m"
find ~/.zshrc -type f -exec sed -i "s/robbyrussel/'$ZSH_THEME'/g" {} \;

echo -e "\n\e[32mInstalling \e[34mCrystal\e[32m...\e[39m"
curl https://dist.crystal-lang.org/apt/setup.sh | sudo $MY_SHELL
sudo apt-get install crystal

echo -e "\n\e[32mInstalling \e[34mVisual Studio Code\e[32m...\e[39m"
wget -O ~/Downloads/vscode-amd64.deb https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i ~/Downloads/vscode-amd64.deb
