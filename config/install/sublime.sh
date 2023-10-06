#!/bin/sh

clear && clear
echo '## Install Sublime Text 3'
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "\n" | sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt-get install sublime-text

cd ~/tmp/
sudo cp -rf config/sublime/Installed\ Packages/ ~/.config/sublime-text/
sudo cp -rf config/sublime/Packages/User/* ~/.config/sublime-text/Packages/User

cd ~/.config/sublime-text/Packages
sudo git clone https://github.com/facelessuser/FavoriteFiles.git
sudo git clone https://github.com/sergeche/emmet-sublime.git
sudo git clone https://github.com/brianlow/FileRename.git
sudo git clone https://github.com/jisaacks/GitGutter.git
sudo git clone https://github.com/kemayo/sublime-text-git.git
sudo git clone https://github.com/yulanggong/IncrementSelection.git
sudo git clone https://github.com/jdavisclark/JsFormat.git
sudo git clone https://github.com/titoBouzout/Open-Include.git
sudo git clone https://github.com/henrikpersson/rsub.git
sudo git clone https://github.com/markbirbeck/sublime-text-shell-command.git
sudo git clone https://github.com/titoBouzout/Tag.git
sudo git clone https://github.com/jarod2d/sublime_valign.git
sudo git clone https://github.com/JasonMortonNZ/bs3-sublime-plugin.git
sudo git clone https://github.com/akalongman/sublimetext-codeformatter.git
sudo git clone https://github.com/esoftplay/sublimetext-snippets.git

