#!/bin/sh

clear && clear
echo '## Install Sublime Text 3'
cd ~/tmp/

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "\n" | sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt-get install sublime-text

mkdir -p ~/.config/sublime-text/Installed\ Packages/
cp -rf config/sublime/Installed\ Packages/ ~/.config/sublime-text

mkdir -p ~/.config/sublime-text/Packages/User/
cp -rf config/sublime/Packages/User/ ~/.config/sublime-text/Packages

cd ~/.config/sublime-text/Packages
git clone https://github.com/facelessuser/FavoriteFiles.git
git clone https://github.com/sergeche/emmet-sublime.git
git clone https://github.com/brianlow/FileRename.git
git clone https://github.com/jisaacks/GitGutter.git
git clone https://github.com/kemayo/sublime-text-git.git
git clone https://github.com/yulanggong/IncrementSelection.git
git clone https://github.com/jdavisclark/JsFormat.git
git clone https://github.com/titoBouzout/Open-Include.git
git clone https://github.com/henrikpersson/rsub.git
git clone https://github.com/markbirbeck/sublime-text-shell-command.git
git clone https://github.com/titoBouzout/Tag.git
git clone https://github.com/jarod2d/sublime_valign.git
git clone https://github.com/JasonMortonNZ/bs3-sublime-plugin.git
git clone https://github.com/akalongman/sublimetext-codeformatter.git
git clone https://github.com/esoftplay/sublimetext-snippets.git

