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

echo -e "\n\e[32mInstalling oh-my-zsh...\e[39m"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo -e "\n\e[32mAppling zsh theme...\e[39m"
find ~/.zshrc -type f -exec sed -i "s/robbyrussel/'$ZSH_THEME'/g" {} \;

echo -e "\n\e[32mInstalling Crystal...\e[39m"
curl https://dist.crystal-lang.org/apt/setup.sh | sudo $MY_SHELL
sudo apt-get install crystal
